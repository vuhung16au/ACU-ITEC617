import { NextResponse } from 'next/server';
import { prisma } from '../../../lib/prisma';
import amqp from 'amqplib';

export async function GET() {
  try {
    const orders = await prisma.order.findMany({
      orderBy: { created_at: 'desc' }
    });
    return NextResponse.json(orders);
  } catch (error) {
    console.error('Error fetching orders:', error);
    return NextResponse.json({ error: 'Failed to fetch orders' }, { status: 500 });
  }
}

export async function POST(request) {
  try {
    const body = await request.json();
    
    // 1. Write to PostgreSQL via Prisma
    const order = await prisma.order.create({
      data: {
        customer_name: body.customer_name,
        item_name: body.item_name,
        quantity: parseInt(body.quantity, 10),
        status: 'pending' // Initial status
      }
    });

    // 2. Publish message to RabbitMQ
    const rabbitMqUrl = process.env.RABBITMQ_URL || 'amqp://guest:guest@localhost:5672';
    const queue = 'order_events';
    
    const connection = await amqp.connect(rabbitMqUrl);
    const channel = await connection.createChannel();
    await channel.assertQueue(queue, { durable: true });
    
    const message = JSON.stringify({ orderId: order.id });
    channel.sendToQueue(queue, Buffer.from(message), { persistent: true });
    
    // Clean up RabbitMQ connection
    setTimeout(() => {
      connection.close();
    }, 500);

    return NextResponse.json(order, { status: 201 });
  } catch (error) {
    console.error('Error creating order:', error);
    return NextResponse.json({ error: 'Failed to create order' }, { status: 400 });
  }
}
