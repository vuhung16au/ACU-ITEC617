import { NextResponse } from 'next/server';
import sqlite3 from 'sqlite3';

const dbPath = process.env.DB_PATH || '/data/database.sqlite';

export async function GET(): Promise<NextResponse> {
  return new Promise<NextResponse>((resolve) => {
    const db = new sqlite3.Database(dbPath, sqlite3.OPEN_READONLY, (err) => {
      if (err) {
        resolve(NextResponse.json({ error: 'Failed to connect to database' }, { status: 500 }));
        return;
      }
    });

    db.all('SELECT * FROM users', (err, rows) => {
      db.close();
      if (err) {
        resolve(NextResponse.json({ error: 'Failed to execute query' }, { status: 500 }));
      } else {
        resolve(NextResponse.json({ users: rows }));
      }
    });
  });
}
