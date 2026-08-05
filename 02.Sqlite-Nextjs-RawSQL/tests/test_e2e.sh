#!/bin/bash
echo "Waiting for Next.js app to start..."
sleep 5
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/api/users)
if [ "$RESPONSE" -eq 200 ]; then
    echo "e2e test passed: API returned 200 for /api/users"
    exit 0
else
    echo "e2e test failed: API returned $RESPONSE"
    exit 1
fi
