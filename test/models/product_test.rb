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
                puts new_product_id
                assert_operator(new_product_id, :>, 0)
        end
    
        # Test query for all product
    
        # Test query single product
    
        # Test Update product

        # Test delete product
    
end