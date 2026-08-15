"use client";

import { useState, useEffect } from "react";

export default function Home() {
  const [orders, setOrders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [customerName, setCustomerName] = useState("");
  const [itemName, setItemName] = useState("");
  const [quantity, setQuantity] = useState("1");
  const [submitting, setSubmitting] = useState(false);

  const fetchOrders = async () => {
    try {
      const res = await fetch("/api/orders");
      const data = await res.json();
      setOrders(data);
    } catch (e) {
      console.error(e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchOrders();
    // Poll every 3 seconds to see status updates from background worker
    const interval = setInterval(fetchOrders, 3000);
    return () => clearInterval(interval);
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setSubmitting(true);
    try {
      await fetch("/api/orders", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          customer_name: customerName,
          item_name: itemName,
          quantity
        })
      });
      setCustomerName("");
      setItemName("");
      setQuantity("1");
      fetchOrders();
    } catch (e) {
      console.error(e);
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <main className="min-h-screen bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-5xl mx-auto">
        <div className="text-center mb-12">
          <h1 className="text-4xl font-extrabold text-gray-900 sm:text-5xl mb-4">
            Postgres + RabbitMQ
          </h1>
          <p className="text-xl text-gray-500 max-w-2xl mx-auto">
            Event-Driven Architecture Example. Creating an order writes to Postgres and drops a message on RabbitMQ. A separate Node.js worker processes the message asynchronously.
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          <div className="lg:col-span-1">
            <div className="bg-white rounded-xl shadow-md p-6">
              <h2 className="text-xl font-bold mb-4 text-gray-800">Create Order</h2>
              <form onSubmit={handleSubmit}>
                <div className="mb-4">
                  <label className="block text-sm font-medium text-gray-700 mb-1">Customer Name</label>
                  <input required type="text" value={customerName} onChange={e => setCustomerName(e.target.value)} className="w-full border border-gray-300 rounded px-3 py-2 text-gray-800" placeholder="e.g. Hung Vu" />
                </div>
                <div className="mb-4">
                  <label className="block text-sm font-medium text-gray-700 mb-1">Item Name</label>
                  <input required type="text" value={itemName} onChange={e => setItemName(e.target.value)} className="w-full border border-gray-300 rounded px-3 py-2 text-gray-800" placeholder="e.g. Laptop" />
                </div>
                <div className="mb-6">
                  <label className="block text-sm font-medium text-gray-700 mb-1">Quantity</label>
                  <input required type="number" min="1" value={quantity} onChange={e => setQuantity(e.target.value)} className="w-full border border-gray-300 rounded px-3 py-2 text-gray-800" />
                </div>
                <button type="submit" disabled={submitting} className="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded transition-colors disabled:opacity-50">
                  {submitting ? "Placing Order..." : "Place Order (Publish Event)"}
                </button>
              </form>
            </div>
          </div>

          <div className="lg:col-span-2">
            <div className="bg-white rounded-xl shadow-md p-6">
              <div className="flex justify-between items-center mb-4">
                <h2 className="text-xl font-bold text-gray-800">Recent Orders</h2>
                <span className="text-xs text-gray-500 flex items-center gap-1">
                  <span className="relative flex h-2 w-2">
                    <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-green-400 opacity-75"></span>
                    <span className="relative inline-flex rounded-full h-2 w-2 bg-green-500"></span>
                  </span>
                  Polling for status...
                </span>
              </div>
              
              {loading ? (
                <div className="text-center py-4 text-gray-500">Loading orders...</div>
              ) : orders.length === 0 ? (
                <div className="text-center py-4 text-gray-500">No orders found.</div>
              ) : (
                <div className="overflow-x-auto">
                  <table className="min-w-full divide-y divide-gray-200">
                    <thead>
                      <tr>
                        <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                        <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Customer</th>
                        <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Item</th>
                        <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Qty</th>
                        <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                      </tr>
                    </thead>
                    <tbody className="bg-white divide-y divide-gray-200">
                      {orders.map((order) => (
                        <tr key={order.id}>
                          <td className="px-4 py-3 whitespace-nowrap text-sm text-gray-500">#{order.id}</td>
                          <td className="px-4 py-3 whitespace-nowrap text-sm font-medium text-gray-900">{order.customer_name}</td>
                          <td className="px-4 py-3 whitespace-nowrap text-sm text-gray-500">{order.item_name}</td>
                          <td className="px-4 py-3 whitespace-nowrap text-sm text-gray-500">{order.quantity}</td>
                          <td className="px-4 py-3 whitespace-nowrap text-sm">
                            <span className={`px-2 inline-flex text-xs leading-5 font-semibold rounded-full ${order.status === 'processed' ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800 animate-pulse'}`}>
                              {order.status}
                            </span>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </main>
  );
}
