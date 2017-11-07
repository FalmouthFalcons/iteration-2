
require 'sqlite3'
require_relative 'customer.rb'
require_relative 'payment_type.rb'

class Order

        attr_accessor  :customer_id, :payment_id, :id

        #Initilze order class
        def initialize(customer = nil, payment_type = nil)
        @customer_id = customer
        @order = order
        @payment_type = payment_type
        end

        # create order with sql
       def create_new_order
        begin
        db = SQLite3::Database.open(ENV["BANGAZON"])
        db.execute('INSERT INTO orders (customer_id, order, payment_type) VALUES (?, ?, ?)', [@customer_id, @order, @payment_type])
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
        WHERE orders.customer_id = customers.id
        AND orders.id = order_products.id
        AND order_products.product_id = products.id;")
        db.close
        end
       end

        # add payment to order by customer and payment id
        def add_payment_type_to_order
                begin
                db = SQLite3::Database.open(ENV["BANGAZON"])
                payment_type_order = db.execute("")
                end
        end

        #add product to order
        #query orders with null payment type
        def add_product_to_order
                begin
                db = SQLite3::Database.open(ENV)
                end
        end


end
