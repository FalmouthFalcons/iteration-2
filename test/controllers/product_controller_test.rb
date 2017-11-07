require 'minitest/autorun'
require_relative '../../app/controllers/product_controller.rb'

class ProductControllerTest < Minitest::Test
    # Setting up with dummy data
    def setup
        @productsController = ProductController.new
        @productsController.product_title = "Red Book"
        @productsController.product_price = "7.99"

    end

    # I'm testing to see that the title created was a blue book
    def test_product_title
        assert_equal @productsController.product_title , "Red Book"
    end

    # Testing to see that the price created was 6.99
    def test_product_price
        assert_equal @productsController.product_price, "7.99"
    end

    # Test GET all product - get


    # Test GET single product - get


    # Test Create product - post
    # I am making sure that the test is running the method to create a new product on the product table.
    def test_add_new_product
       new_product =  @productsController.add_new_product
    #    assert_operator(new_product, :>, 0)
    end

    # This method should take the 


    # Test Update product by id - patch/put

    # Test delete


end