require 'sqlite3'
class Product
        
        attr_accessor :product_title, :product_price, :id

        #intialze that creates product fields
        def initialize (product_title = nil, product_price = nil, customer_id = nil)
                @product_title = product_title
                @product_price = product_price
                @customer_id = customer_id
        end
    
        # create product sql
        # I am creating a product and adding it to the database
        def create_new_product
                begin
                        db = SQLite3::Database.open(ENV["BANGAZON"])
                        db.execute('INSERT INTO products (product_title, product_price, customer_id) VALUES (?, ?, ?)',[ @product_title, @product_price, @customer_id])
                        last_record = db.last_insert_row_id
                        db.close
                        last_record
                rescue SQLite3::Exception => e
                        p "Exception with create_new_product database query: #{e}"
                end

        end
    
        # query for all product
    
        # query single product
    
        # Update product
   
        # delete product
    
end