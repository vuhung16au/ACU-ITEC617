import { Suspense } from "react";
import dbConnect from "../lib/mongodb";
import User from "../models/User";

async function getUsers() {
  await dbConnect();
  // Fetch users and convert _id to string for serialization
  const users = await User.find({}).lean();
  return users.map(user => ({
    ...user,
    _id: user._id.toString(),
    createdAt: user.createdAt.toISOString()
  }));
}

async function UserList() {
  let users = [];
  try {
    users = await getUsers();
  } catch (e) {
    return <div className="text-red-500">Error connecting to MongoDB: {e.message}</div>;
  }

  if (users.length === 0) {
    return <p className="text-gray-500 text-center py-4">No users found. Are you sure the database is seeded?</p>;
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      {users.map((user) => (
        <div key={user._id} className="bg-white rounded-xl shadow-md overflow-hidden border border-gray-100 hover:shadow-lg transition duration-300">
          <div className="p-6">
            <div className="flex justify-between items-start mb-4">
              <div>
                <h3 className="text-xl font-bold text-gray-800">{user.firstName} {user.lastName}</h3>
                <p className="text-sm text-gray-500">{user.email}</p>
              </div>
              <span className={`px-3 py-1 rounded-full text-xs font-semibold ${user.role === 'admin' ? 'bg-indigo-100 text-indigo-800' : 'bg-green-100 text-green-800'}`}>
                {user.role}
              </span>
            </div>
            
            <div className="mt-4 pt-4 border-t border-gray-100">
              <h4 className="text-sm font-semibold text-gray-600 mb-2">Address (Embedded Document)</h4>
              {user.address ? (
                <p className="text-sm text-gray-600 bg-gray-50 p-2 rounded">
                  {user.address.street}, {user.address.city}, {user.address.state} {user.address.postcode}
                </p>
              ) : (
                <p className="text-sm text-gray-400 italic">No address provided</p>
              )}
            </div>

            <div className="mt-4 pt-4 border-t border-gray-100">
              <h4 className="text-sm font-semibold text-gray-600 mb-2">Preferences (Embedded Document)</h4>
              <div className="flex gap-2">
                <span className="text-xs bg-gray-100 text-gray-700 px-2 py-1 rounded">Theme: {user.preferences?.theme || 'default'}</span>
                <span className="text-xs bg-gray-100 text-gray-700 px-2 py-1 rounded">Newsletter: {user.preferences?.newsletter ? 'Yes' : 'No'}</span>
              </div>
            </div>
          </div>
        </div>
      ))}
    </div>
  );
}

export default function Home() {
  return (
    <main className="min-h-screen bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-12">
          <h1 className="text-4xl font-extrabold text-gray-900 sm:text-5xl sm:tracking-tight lg:text-6xl mb-4">
            MongoDB & Mongoose
          </h1>
          <p className="text-xl text-gray-500 max-w-3xl mx-auto">
            This example demonstrates how to connect a Next.js application to a NoSQL Document Store (MongoDB) using Mongoose.
            Notice how embedded documents (like Address and Preferences) are naturally stored without complex joins.
          </p>
        </div>

        <div className="mb-8">
          <h2 className="text-2xl font-bold text-gray-800 mb-6">Users Collection</h2>
          <Suspense fallback={<div className="text-center py-10">Loading users from MongoDB...</div>}>
            <UserList />
          </Suspense>
        </div>
      </div>
    </main>
  );
}
