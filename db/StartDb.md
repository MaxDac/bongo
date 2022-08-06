## To start the Database use docker-compose with this script:

```
# Use root/example as user/password credentials
version: '3.1'

services:

  mongo:
    container_name: mongodatabase
    image: mongo
    restart: unless-stopped
    ports:
      - 27017:27017
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: mysecretpassword

  mongo-express:
    container_name: mongoexpress
    image: mongo-express
    restart: unless-stopped
    ports:
      - 8081:8081
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME: root
      ME_CONFIG_MONGODB_ADMINPASSWORD: mysecretpassword
      ME_CONFIG_MONGODB_URL: mongodb://root:example@mongo:27017/
```
