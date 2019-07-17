# Example Get and POST request

### Alot of people get to specify the content type

```bash

curl http://localhost:3000/api_todo_lists.json

curl \
-i \
-H "Accept: application/json" \
-H "Content-type: application/json" \
-X POST \
-d '{"title": "hello", "content": ""}' http://localhost:3000/api/items

# DELETE command
curl \
-i \
-H "Accept: application/json" \
-H "Content-type: application/json" \
-X DELETE \
http://localhost:3000/api/items/2.json

# Basic authentication
curl \
--basic \
-u pheil:catspaw \
http://localhost:3000/api/items.json

```
