import { NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';
import Redis from 'ioredis';

const prisma = new PrismaClient();

// Connect to Redis using the provided URL
const redis = new Redis(process.env.REDIS_URL || 'redis://localhost:6379');

export async function GET() {
  try {
    const cacheKey = 'users_list';
    
    // 1. Check the cache
    const cachedUsers = await redis.get(cacheKey);
    
    if (cachedUsers) {
      // CACHE HIT
      return NextResponse.json({
        cacheStatus: 'HIT',
        data: JSON.parse(cachedUsers),
      });
    }

    // 2. CACHE MISS: Fetch from PostgreSQL
    // We add a slight artificial delay to make the difference noticeable
    await new Promise(resolve => setTimeout(resolve, 500));
    const users = await prisma.users.findMany();
    
    // 3. Store in cache for future requests (TTL 60 seconds)
    await redis.set(cacheKey, JSON.stringify(users), 'EX', 60);

    return NextResponse.json({
      cacheStatus: 'MISS',
      data: users,
    });
    
  } catch (error) {
    console.error('Error fetching users:', error);
    return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 });
  }
}
