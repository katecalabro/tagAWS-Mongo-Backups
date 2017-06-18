#!/bin/bash
MONGO_DB="theangelettigroup"

mongo MONGO_DB --eval "db.dropDatabase();"
