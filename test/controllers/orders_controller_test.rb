require 'minitest/autorun'
require_relative './app/controllers/orders_controller.rb'


class OrderControllerTest < Minitest::Test
    
    def setup
        @orderController = OrderController.new
    end

    #Test for initialize
    def test_initialize_order_controller
            assert_intance_of OrderController, @orderController
    end

    # Test add_product_to_order
    # will call create_new_order by customer_id & add_product_to_order
    #if statement for if order exists
    def test_add_product_to_shopping_cart
        new_order = OrderController.create_new_order(1)
        assert_operator new_order, :>, 0
        product_added_to_order = OrderController.add_product_to_order
        assert_operator product_added_to_order, :>, 0
    end

    # calls:
    # get_customer_order with product price sum
    # add_payment_to_order

    # if no products in order print "Please add some products to your order first. Press any key to return to main menu."
    #*******would there be an order with no products???????
   def test_complete_customer_order
    customer_order = OrderController.get_customer_order(1)
    assert_instance_of(Array, customer_order)
    add_payment = OrderController.add_payment_to_order(1)
    assert_instance_of Array, add_payment
    refute_nil add_payment[0][2]
   end


end