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

#test_destroy_product not needed -- same thing happens in product_test.rb
def test_destroy_products
    
end


    #set_active_customer_
    #and_get_active_customer??

    # Test GET all product - get
    # This will return all of the products that a customer has
    def get_customer_products(1)
        
    end


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