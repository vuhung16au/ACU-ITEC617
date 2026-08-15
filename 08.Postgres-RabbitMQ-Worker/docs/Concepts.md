# Event-Driven Architecture and Message Queues

## Event-Driven Architecture

An event-driven architecture uses events to trigger and communicate between decoupled services and is common in modern applications built with microservices. An event is a change in state, or an update, like an item being placed in a shopping cart on an e-commerce website.

## Message Queues (RabbitMQ)

A message broker (like RabbitMQ) receives messages from producers (like our Next.js API) and routes them to consumers (like our Node.js Worker).

### Why use a Message Broker?
- **Asynchronous Processing:** Don't keep the user waiting. The API can return a `201 Created` immediately after writing to the database and dropping a message in the queue. The heavy lifting (like generating PDFs, sending emails, or calling slow third-party APIs) is done in the background.
- **Decoupling:** The API doesn't need to know who is processing the message.
- **Reliability:** If the worker crashes, the message stays in the queue until a worker successfully processes it (acknowledgment).

### Components in this Project
1. **Producer**: The Next.js API (`app/api/orders/route.js`).
2. **Broker**: RabbitMQ (running in Docker).
3. **Consumer**: The Node.js Worker (`worker/index.js`), which connects, listens for messages, processes them, and updates the database to mark them as 'processed'.
