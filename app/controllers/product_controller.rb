require_relative '../models/product.rb'
require_relative 'customers_controller.rb'

class ProductController 
    def initialize
        @CustomersController = CustomersController.new
        @product = Product.new
    end

    attr_accessor :product_title, :product_price, :customer_id

    # I'm creating the menu that will allow the user to enter in the info for a new product
    def add_new_product_menu
        puts "Enter Product Title:"
        p ">"
        @product_title = set_field
        puts "Enter The Product's Price:"
        p ">"
        @product_price = set_field
        puts "Enter The Customer's ID:"
        p ">"
        @customer_id = set_field

        add_new_product
    end 

    # This will be the menu to update a customer's product
    def update_customer_product_menu
        # get all the products by customer
        @active_customer = CustomersController.get_active_customer
        
        customer_products = @product.get_all_active_customer_products(@active_customer)
        puts "select which product you want"
        customer_products.each_with_index do |product, index|
            puts "#{index}. #{product[1]}"

        end
        product_choosen = gets.chomp
        
    end
    
    # This method is collecting the user's input
    def set_field
        begin
        gets.chomp
        rescue SQLite3::Exception => e
        p "Exception with set_field: #{e}"
        end
    end


    # GET all product for a single customer - get
    def list
    list_of_products = Product.new.get_all_products(@active_customer)
    puts "Select(product by id to update account:"
    list_of_products.each_with_index do |customer, index|
        puts "#{list_of_products}"
    end
    # GET single product - get


    # Create product - post
    def add_new_product
            aProduct = Product.new(@product_title, @product_price, @customer_id)
            aProduct.create_new_product
    end


    # Update product by id - patch/put
    def update_customer_product
        aProduct = Product.new(@product_title, @product_price, @customer_id)
        aProduct.update_product

    end

    # Delete product by id - destroy
    def delete_product(single_product_id)
        Product.new.destroy_product(single_product_id)
    end
end 
end
