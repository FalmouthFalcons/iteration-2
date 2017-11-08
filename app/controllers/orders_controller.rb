require_relative '../models/customer.rb'
require_relative '../models/order.rb'
require_relative '../models/product.rb'

class OrderController 
    
    attr_accessor :customer_id, :payment_type_id, :product_title, :product_price

    # add_product_to_order
    # will call create_new_order by customer_id & add_product_to_order
    #if statement for if order exists
    def set_field
        begin
        gets.chomp
        rescue SQLite3::Exception => e
        p "Exception with set_field: #{e}"
        end
    end

    def add_product_to_shopping_cart
        # display list of all products, and puts a "enter product # to to select a product from the list, 

       add_product_to_shopping_cart = Product.new.get_all_products
        add_product_to_shopping_cart.each_with_index do |product_row, index|
            puts "#{index+1}. #{product_row[1]} #{product_row[2]}"
        end
         # getting user input 
        puts "Add product to cart by selecting number:"
        @add_product_to_order = set_field

        selected_product = add_product_to_shopping_cart[(@add_product_to_order.to_i - 1)]

        puts "Selected Product(s): #{selected_product[1]} #{selected_product[2]}"
    
        current_order_row = Order.new.get_customer_order
        if current_order_row.length == 0 
        # if active user has no orders, create a new one for 
        new_order = Order.new(CustomersController.get_active_customer) 

            new_order.id = new_order.create_new_order
            new_order.add_product_to_order(selected_product[0])
            
        else  

            current_order = Order.new
            
            current_order.id = current_order_row[0][3]
            
            current_order.add_product_to_order(selected_product[0]) 
        end 
    end
    # complete order
    
    #*******would there be an order with no products???????
    def complete_customer_order
        
        # call the get_customer_order with product price sum
        customer_order_total = Order.new.get_customer_order(CustomersController.get_active_customer)
        
        if get_customer_order.length  == 0
            puts "You have no products on your order. Please press any key to return to the main menu"
            
            # if no products in order print "Please add some products to your order first. Press any key to return to main menu."
        else 
            # display order total and "continue with the order? y/n"
            puts "Ready to purchase? (Y/N)"
            @add_payment_to_order = set_field 
            
            # add_payment_to_order
            puts "Please select a payment type:"
            

   end
end
