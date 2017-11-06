require 'minitest/autorun'
require_relative '../../app/models/product.rb'


class ProductTest < Minitest::Test
    
        #setup
        def setup
                
                        @product = Product.new("product_title", "product_price", 1)
                        @new_product =  @product.create_new_product
                        @product.id = @new_product

        end
        #Test for instance intialize that creates product fields
    
        # Test create product sql
        # I am testing that the product was created(I think, but maybe not)
        def test_create_new_product
                
                        new_product_id = @product.create_new_product
                        puts new_product_id
                        assert_operator(new_product_id, :>, 0)

                

        end
    
        # Test query for all product
    
        # Test query single product
    
        # Test Update product

        # Test delete product
    
end