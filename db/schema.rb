require 'sqlite3'

class Schema

    def self.create
        db = SQLite3::Database.open('db/bangazon_sqlite3.sqlite3')

        
        db.execute  "CREATE TABLE `customers` (
            `id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            `last_name`	text NOT NULL,
            `first_name`	text NOT NULL,
            `phone_number`	text NOT NULL,
            `street_address`	text NOT NULL,
            `city`	text NOT NULL,
            `us_state`	text NOT NULL,
            `zip_code`	integer NOT NULL
        );"


        db.execute "CREATE TABLE `product_types` (
            `id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            `product_type`	text NOT NULL
           
        );"

        db.execute "CREATE TABLE `payment_types` (
            `id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            `payment_type`	text NOT NULL,
            `account_number`	integer NOT NULL,
            `customer_id`	integer NOT NULL
           
        );
"

        db.execute  "CREATE TABLE `products` (
            `id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            `product_title`	text NOT NULL,
            `product_price`	float NOT NULL,
            `customer_id`	integer NOT NULL
           
        );
"
        db.execute "CREATE TABLE `orders` (
            `id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            `customer_id`	integer NOT NULL,
            `payment_type_id`	integer
           
        );"

        db.execute "CREATE TABLE `order_products` (
            `id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            `product_id`	integer NOT NULL,
            `order_id`	integer NOT NULL
            
        );"




    end
end

Schema.create