#!/bin/bash
echo "Waiting for API to start..."
sleep 3
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8000/users)
if [ "$RESPONSE" -eq 200 ]; then
    echo "e2e test passed: API returned 200 for /users"
    exit 0
else
    echo "e2e test failed: API returned $RESPONSE"
    exit 1
fi
