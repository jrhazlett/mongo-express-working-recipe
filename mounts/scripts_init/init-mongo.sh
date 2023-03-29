# This script is necessary because the database won't setup accounts by default
USER=`jq --arg v "$MONGO_INITDB_ROOT_USERNAME" -n '$v'`
PASSWORD=`jq --arg v "$MONGO_INITDB_ROOT_PASSWORD" -n '$v'`

# Run mongosh and pass the javascript for adding users
mongosh -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD" admin <<EOF
    use foo;
    db.createUser({
        user: $USER,
        pwd: $PASSWORD,
        roles: ["readWrite"],
    });
EOF
