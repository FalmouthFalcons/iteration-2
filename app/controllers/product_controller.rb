require_relative '../models/product.rb'

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
    list_of_products = Product.new.get_all_products
    puts "Select customer by id to update account:"
    list_of_customers.each_with_index do |customer, index|
        puts "#{index+1}. #{customer[2]} #{customer[1]}"
    end





    # GET single product - get


    # Create product - post
    def add_new_product
            aProduct = Product.new(@product_title, @product_price, @customer_id)
            aProduct.create_new_product
    end


    # Update product by id - patch/put

    # Delete product by id - destroy
    def delete_product(single_product_id)
        Product.new.destroy_product(single_product_id)
    end

end
