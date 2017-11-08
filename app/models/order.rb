
require 'sqlite3'
require_relative 'customer.rb'
require_relative 'payment_type.rb'

class Order

        attr_accessor  :customer_id, :payment_id, :id

        #Initilze order class

        def initialize(customer = nil, payment_type = nil, id = nil)
        @customer_id = customer
        @id = id
        @payment_type = payment_type
        end

        # create order with sql
       def create_new_order
        begin
        db = SQLite3::Database.open(ENV["BANGAZON"])

        db.execute('INSERT INTO orders (customer_id, id, payment_type_id) VALUES (?, ?, ?)', [@customer_id, @id, @payment_type])
        last_record = db.last_insert_row_id
        db.close
        last_record
        end
       end

        # query orders by customer_id
        # needs to query orders and order_products tables to get order with products
       def get_customer_order
        begin
        db = SQLite3::Database.open(ENV["BANGAZON"])
        array_of_orders = db.execute("SELECT customers.id 'Customer Number', customers.last_name 'Last Name', customers.first_name 'First Name', orders.id 'Order Number',  products.product_title 'Product', products.product_price 'Price'
        FROM orders, customers, order_products, products

        WHERE orders.customer_id = ?
        AND orders.id = ?
        AND order_products.product_id = products.id", [@customer_id, @id])
        db.close
        end
        array_of_orders
       end

        # add payment to order by customer and payment type
        def add_payment_type_to_order(payment_type_id)
                begin
                db = SQLite3::Database.open(ENV["BANGAZON"])
                order_payment = db.execute("UPDATE orders set customer_id = ?, payment_type_id = ? where id = ?",[@customer_id, payment_type_id, @id])
                db.close
                end
                order_payment
        end

        #add product_id to orders thru order_products by orderid
        #add row to join table
        #query orders with null payment type
        def add_product_to_order(product_id)
                begin
                db = SQLite3::Database.open(ENV["BANGAZON"])
                new_order_product_id = db.execute('INSERT into order_products (product_id, order_id) VALUES (?,?)', [product_id, @id])
                db.close
                end
                add_product_to_order
        end


end
