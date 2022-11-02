#!/bin/bash

curl -sv http://localhost:4000/api/businesses \
-H "Content-Type: application/json" \
-d '{"business": {"name": "Yet another company", "description": "Another short description!", "tag": "IT"}}' \
| jq