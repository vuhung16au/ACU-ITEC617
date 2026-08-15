const amqp = require('amqplib');
const { Client } = require('pg');

const RABBITMQ_URL = process.env.RABBITMQ_URL || 'amqp://guest:guest@rabbitmq:5672';
const DATABASE_URL = process.env.DATABASE_URL || 'postgres://user:password@postgres:5432/itec617';
const QUEUE_NAME = 'order_events';

async function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function startWorker() {
  console.log("Starting background worker...");

  // Wait for RabbitMQ and Postgres to be ready
  await sleep(10000);

  const dbClient = new Client({ connectionString: DATABASE_URL });
  await dbClient.connect();
  console.log("Connected to PostgreSQL.");

  let connection;
  try {
    connection = await amqp.connect(RABBITMQ_URL);
    console.log("Connected to RabbitMQ.");
  } catch (error) {
    console.error("Failed to connect to RabbitMQ:", error);
    process.exit(1);
  }

  const channel = await connection.createChannel();
  await channel.assertQueue(QUEUE_NAME, { durable: true });

  console.log(`Waiting for messages in [${QUEUE_NAME}]. To exit press CTRL+C`);

  channel.consume(QUEUE_NAME, async (msg) => {
    if (msg !== null) {
      const eventData = JSON.parse(msg.content.toString());
      console.log(`[x] Received event:`, eventData);
      
      const orderId = eventData.orderId;

      console.log(`[Processing] Generating invoice and dispatching emails for Order #${orderId}...`);
      await sleep(3000); // Simulate heavy lifting

      // Update order status in PostgreSQL
      try {
        await dbClient.query('UPDATE "Order" SET status = $1 WHERE id = $2', ['processed', orderId]);
        console.log(`[✔] Order #${orderId} marked as processed.`);
      } catch (dbError) {
        console.error("Failed to update database:", dbError);
      }

      channel.ack(msg); // Acknowledge message so it is removed from the queue
    }
  }, { noAck: false });
}

startWorker().catch(console.error);
