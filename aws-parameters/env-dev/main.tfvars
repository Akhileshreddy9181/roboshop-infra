parameters = [
   { name = "dev.frontend.catalogue_url", value = "http://catalogue-dev.devopsa.online:8080/", type = "String"},
   { name = "dev.frontend.user_url", value = "http://user-dev.devopsa.online:8080/", type = "String"},
   { name = "dev.frontend.cart_url", value = "http://cart-dev.devopsa.online:8080/", type = "String"},
   { name = "dev.frontend.shipping_url", value = "http://shipping-dev.devopsa.online:8080/", type = "String"},
   { name = "dev.frontend.payment_url", value = "http://payment-dev.devopsa.online:8080/", type = "String"},
   { name = "dev.user.mongo", value = "true", type = "String"},
   { name = "dev.user.redis_host", value = "redis-dev.devopsa.online", type = "String"},
   { name = "dev.user.mongo_url", value = "mongodb://mongodb-dev.devopsa.online:27017/catalogue", type = "String"},
   { name = "dev.shipping.cart_endpoint", value = "cart-dev.devopsa.online:8080", type = "String"},
   { name = "dev.shipping.db_host", value = "mysql-dev.devopsa.online", type = "String"},
   { name = "dev.payment.cart_host", value = "cart-dev.devopsa.online", type = "String"},
   { name = "dev.payment.cart_port", value = "8080", type = "String"},
   { name = "dev.payment.user_host", value = "user-dev.devopsa.online", type = "String"},
   { name = "dev.payment.user_port", value = "8080", type = "String"},
   { name = "dev.payment.amqp_host", value = "rabbitmq-dev.devopsa.online", type = "String"},
   { name = "dev.catalogue.mongo", value = "true", type = "String"},
   { name = "dev.catalogue.mongo_url", value = "mongodb://mongodb-dev.devopsa.online:27017/users", type = "String"},
   { name = "dev.cart.redis_host", value = "redis-dev.devopsa.online", type = "String"},
   { name = "dev.cart.catalogue_host", value = "catalogue-dev.devopsa.online", type = "String"},
   { name = "dev.cart.catalogue_port", value = "8080", type = "String"}
]


secrets = [
   { name = "dev.mysql.password", value = "RoboShop@1", type = "SecureString"},
   { name = "dev.payment.amqp_user", value = "roboshop", type = "SecureString"},
   { name = "dev.payment.amqp_pass", value = "roboshop123", type = "SecureString"},
   { name = "dev.rabbitmq.amqp_user", value = "roboshop", type = "SecureString"},
   { name = "dev.rabbitmq.amqp_pass", value = "roboshop123", type = "SecureString"},
   { name = "dev.docdb.user", value = "admin1", type = "SecureString"},
   { name = "dev.docdb.pass", value = "Roboshop1", type = "SecureString"},
   { name = "dev.rds.user", value = "admin1", type = "SecureString"},
   { name = "dev.rds.pass", value = "Roboshop1", type = "SecureString"},

]






