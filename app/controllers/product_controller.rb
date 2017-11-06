class ProductController 
    attr_accessor :product_title, :product_price, :customer_id

    # I'm creating the menu that will allow the user to enter in the info for a new product
    def add_new_product_menu
        puts "Enter Product Title:"
        p ">"
        @product_title = set_field
        puts "Enter The Produs's Price:"
        p ">"
        @product_price = set_field
        puts "Enter The Customer's ID:"
        p ">"
        @customer_id = set_field

        add_new_product
    end
    
    # This method is collecting the user's input
    def set_field
        begin
        gets.chomp
        rescue SQLite3::Exception => e
        p "Exception with set_field: #{e}"
        end
    end


    # GET all product - get


    # GET single product - get


    # Create product - post
    def add_new_product
            aProduct = product.new(product_title, product_price, customer_id)
            aProduct.create_new_product
    end


    # Update product by id - patch/put

    # Delete product by id - destroy


end
