'use client';

import { useState } from 'react';

type User = {
  id: number;
  first_name: string;
  last_name: string;
  email: string;
  city: string;
  state: string;
};

export default function Home() {
  const [users, setUsers] = useState<User[]>([]);
  const [cacheStatus, setCacheStatus] = useState<'HIT' | 'MISS' | null>(null);
  const [fetchTime, setFetchTime] = useState<number | null>(null);
  const [loading, setLoading] = useState(false);

  const fetchUsers = async () => {
    setLoading(true);
    const start = performance.now();
    try {
      const response = await fetch('/api/users');
      const result = await response.json();
      
      const end = performance.now();
      
      setUsers(result.data || []);
      setCacheStatus(result.cacheStatus);
      setFetchTime(Math.round(end - start));
    } catch (error) {
      console.error('Failed to fetch users:', error);
    } finally {
      setLoading(false);
    }
  };

  const clearUI = () => {
    setUsers([]);
    setCacheStatus(null);
    setFetchTime(null);
  };

  return (
    <main className="min-h-screen bg-gray-50 p-8 font-[family-name:var(--font-geist-sans)]">
      <div className="max-w-4xl mx-auto space-y-8">
        
        <div className="bg-white p-8 rounded-xl shadow-sm border border-gray-100">
          <h1 className="text-3xl font-bold text-gray-900 mb-4">Postgres + Redis Cache Demo</h1>
          <p className="text-gray-600 mb-6">
            Click the button below to fetch user data. The first request will be a 
            <span className="font-semibold text-orange-600 mx-1">CACHE MISS</span> 
            (slower, fetches from DB). Subsequent requests within 60 seconds will be a 
            <span className="font-semibold text-emerald-600 mx-1">CACHE HIT</span> 
            (faster, fetches from Redis).
          </p>
          
          <div className="flex items-center gap-4">
            <button
              onClick={fetchUsers}
              disabled={loading}
              className="bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-6 rounded-lg transition-colors disabled:opacity-50"
            >
              {loading ? 'Fetching...' : 'Fetch Users'}
            </button>
            <button
              onClick={clearUI}
              className="text-gray-500 hover:text-gray-700 font-medium py-2 px-4 transition-colors"
            >
              Clear UI
            </button>
          </div>
        </div>

        {cacheStatus && (
          <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-100 flex items-center justify-between">
            <div className="flex items-center gap-4">
              <span className="text-gray-500 font-medium">Status:</span>
              {cacheStatus === 'HIT' ? (
                <span className="bg-emerald-100 text-emerald-700 font-bold px-3 py-1 rounded-full text-sm">
                  ⚡ CACHE HIT
                </span>
              ) : (
                <span className="bg-orange-100 text-orange-700 font-bold px-3 py-1 rounded-full text-sm">
                  🐢 CACHE MISS
                </span>
              )}
            </div>
            <div className="text-gray-500 font-medium">
              Time taken: <span className="text-gray-900 font-bold">{fetchTime}ms</span>
            </div>
          </div>
        )}

        {users.length > 0 && (
          <div className="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
            <table className="w-full text-left">
              <thead className="bg-gray-50 border-b border-gray-100">
                <tr>
                  <th className="px-6 py-4 font-medium text-gray-500">Name</th>
                  <th className="px-6 py-4 font-medium text-gray-500">Email</th>
                  <th className="px-6 py-4 font-medium text-gray-500">Location</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {users.map((user) => (
                  <tr key={user.id} className="hover:bg-gray-50 transition-colors">
                    <td className="px-6 py-4">
                      {user.first_name} {user.last_name}
                    </td>
                    <td className="px-6 py-4 text-gray-500">
                      {user.email}
                    </td>
                    <td className="px-6 py-4">
                      {user.city}, {user.state}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </main>
  );
}
