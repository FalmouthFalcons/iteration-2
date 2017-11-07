
require 'sqlite3'
require_relative 'customer.rb'
require_relative 'payment_type.rb'

class Order

        attr_accessor  :customer_id, :payment_id, :id

        #Initilze order class
        def initialize(customer = nil, payment_type = nil)
        @customer = customer
        @order = order
        @payment_type = payment_type
        end

        # create order with sql
       def create_new_order
       end

        # query orders by customer_id
        # needs to query orders and order_products tables to get order with products
       def get_customer_order
       end

        # add payment to order by customer and payment id
        def add_payment_type_to_order
        end

        #add product to order
        #query orders with null payment type
        def add_product_to_order
        end

    
end