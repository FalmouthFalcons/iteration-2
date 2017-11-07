require 'minitest/autorun'
require_relative '../../app/models/order.rb'
require_relative '../../app/models/customer.rb'
require_relative '../../app/models/payment_type.rb'
require_relative '../../app/models/product.rb'


class OrderTest < Minitest::Test

        #setup
        def setup
                @customer = Customer.new("last_name", "first_name", "phone_number", "street_address", "city", "us_state", "zip_code").create_new_customer
                @payment_type = PaymentType.new("payment_type", "account_number", @customer).create_new_payment_type
                @order = Order.new(@customer, @payment_type)
                @product = Product.new("product_title", "product_price", @customer)
                @order.id = @new_order_id
        end

        #Test for initialize
        def test_initialize_order
                assert_instance_of Order, @order
        end

        # Test create order with sql
        def test_create_order_sql
                new_order_id = @order.create_new_order
                assert_operator(new_order_id, :>, 0)
        end



        # test query orders by customer_id
        # needs to query orders and order_products tables to get order with products
        def test_get_customer_order
                customer_order = @order.get_customer_order
                # test returns an array
                assert_instance_of(Array, customer_order)
        end

        # test add payment to order by customer and payment id
        def test_add_payment_to_order
                order_payment = @order.add_payment_type_to_order(1)
                assert_instance_of(Array, order_payment)
        end

        #Test add product to order
        #query orders with null payment type
        def test_add_product_to_order
                new_order_product_id = @order.add_product_to_order(1)
                assert_operator(new_order_product_id, :>, 0)
        end


end
