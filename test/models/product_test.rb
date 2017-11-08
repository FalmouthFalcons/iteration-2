require 'minitest/autorun'
require_relative '../../app/models/product.rb'


class ProductTest < Minitest::Test
    

         #setup
         def setup
                @product = Product.new("Blue Book", "6.99", 1)
        end
        # Test create product sql
        # I am testing that the product was created(I think, but maybe not)
        def test_create_new_product
                new_product_id = @product.create_new_product
                assert_operator(new_product_id, :>, 0)
        end


         # Test for initialized class with arguments
         def test_initialize_with_arguments
                assert_instance_of Product, Product.new("arg1", "arg2")
        end


        #test for deleting product
        def test_destroy_product
                new_product_id = @product.create_new_product
                destroy_product = @product.destroy_product(new_product_id)
                assert_equal 0, destroy_product.length
        end

        # And when one is selected, it should be deleted from the system if it has not been added to an order yet


        #Test for instance intialize that creates product fields
    

        # Test create product sql
        # I am testing that the product was created(I think, but maybe not)
        def test_create_new_product
                new_product_id = @product.create_new_product
                assert_operator(new_product_id, :>, 0)
        end
    
        # Test query for all product
        def test_all_products
                all_products = @product.get_all_products
                # test returns array
                assert_instance_of(Array, all_products)
        end
    
        # Test query single product
    
        # Test Update product

        # Test delete product
    
end