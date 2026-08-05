import React from 'react';
export const dynamic = 'force-dynamic';
import sqlite3 from 'sqlite3';

const dbPath = process.env.DB_PATH || '/data/database.sqlite';

// Next.js Server Component fetching data directly from SQLite
async function fetchUsers() {
  return new Promise<any[]>((resolve, reject) => {
    const db = new sqlite3.Database(dbPath, sqlite3.OPEN_READONLY, (err) => {
        if (err) reject(err);
    });
    db.all('SELECT * FROM users', (err, rows) => {
        db.close();
        if (err) reject(err);
        else resolve(rows);
    });
  });
}

export default async function Home() {
  const users = await fetchUsers().catch(() => []);

  return (
    <main className="flex min-h-screen flex-col items-center p-24 bg-gray-50 text-gray-900">
      <h1 className="text-4xl font-bold mb-8 text-blue-700">Australian Users List (Raw SQL + SQLite)</h1>
      <div className="w-full max-w-4xl bg-white shadow-md rounded-lg overflow-hidden">
        <table className="min-w-full leading-normal">
          <thead>
            <tr>
              <th className="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">ID</th>
              <th className="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">First Name</th>
              <th className="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Last Name</th>
              <th className="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Email</th>
              <th className="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">City</th>
              <th className="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">State</th>
            </tr>
          </thead>
          <tbody>
            {users.map((user) => (
              <tr key={user.id}>
                <td className="px-5 py-5 border-b border-gray-200 bg-white text-sm">{user.id}</td>
                <td className="px-5 py-5 border-b border-gray-200 bg-white text-sm">{user.first_name}</td>
                <td className="px-5 py-5 border-b border-gray-200 bg-white text-sm font-bold">{user.last_name}</td>
                <td className="px-5 py-5 border-b border-gray-200 bg-white text-sm text-blue-500">{user.email}</td>
                <td className="px-5 py-5 border-b border-gray-200 bg-white text-sm">{user.city}</td>
                <td className="px-5 py-5 border-b border-gray-200 bg-white text-sm font-semibold">{user.state}</td>
              </tr>
            ))}
          </tbody>
        </table>
        {users.length === 0 && <p className="p-4 text-center text-gray-500">No users found or database not connected.</p>}
      </div>
    </main>
  );
}
