require_relative 'customers_controller.rb'
require_relative 'product_controller.rb'
require_relative 'payment_type_controller.rb'
require_relative 'orders_controller.rb'
# require_relative 'product_type_controller.rb'


class MainMenuController

  def display_main_menu
    while true 
    # Main menu presented to the user
    puts "*************************************************"
    puts "Welcome to Bangazon! Command Line Ordering System"
    puts "*************************************************"
    puts "1. Create a customer account"
    puts "2. Choose active customer"
    puts "3. Add a payment type for customer"
    puts "4. Create a new product" 
    puts "5. Add product to shopping cart"
    puts "6. Complete an order"
    puts "7. Remove customer product"
    puts "8. Update product information"
    # needs active_customer not nil? 

    # puts "9. Show stale products"
    # puts "10. Show customer revenue report"
    # puts "11. Show overall product popularity"
    puts "12. Leave Bangazon!"


    puts ">"
    user_input = gets.chomp

    case user_input
    
    when "1"
      # Call the method that will display the prompts for creating a new customer here.
      CustomersController.new.add_new_customer_menu
    
    when "2"
      # Call the method that will display the prompts for choosing an active customer here.
      CustomersController.new.menu_for_getting_active_customer 
    
    when "3"
      # # Is "2" active customer selected? 
      # # If NO, puts "must select customer from option 2", redirect to main menu.
      if CustomersController.get_active_customer == nil 
        puts "Must select active customer from option 2."
      else 
      # # If YES, Call the method that will display the prompts for adding payment type.
      PaymentTypeController.new.add_payment_type_menu
      # and confirm this update back at the main menu in a puts, via the payment_type_controller...
      end   

    when "4"
      # # Is "2" active customer selected? 
      # # If NO, puts "must select customer from option 2", redirect to main menu.
      if CustomersController.get_active_customer == nil 
        puts "Must select active customer from option 2."
      else
      # Call the method that will display the prompts for ... adding a new product
      ProductController.new.add_new_product_menu
      end 

    when "5"
      # # Is "2" active customer selected? 
      # # If NO, puts "must select customer from option 2", redirect to main menu.
      if CustomersController.get_active_customer == nil 
        puts "Must select active customer from option 2."
      else
        OrderController.new.add_product_to_shopping_cart 
      # Call the method that will display the prompts for ... add product to chopping cart (order)  
      end 

    when "6"
      # # Is "2" active customer selected? 
      # # If NO, puts "must select customer from option 2", redirect to main menu.
      if CustomersController.get_active_customer == nil 
        puts "Must select active customer from option 2."
      else
        # Call the method that will display the prompts for ... complete an order 
        OrdersController.new.complete_customer_order
      end 
        
      when "7"
        # # Is "2" active customer selected? 
        # # If NO, puts "must select customer from option 2", redirect to main menu.
        if CustomersController.get_active_customer == nil 
          puts "Must select active customer from option 2."
        else
          ProductController.new.delete_product  
          # Call the method that will display the prompts for ... delete single product
        end 
          
        when "8"
          # # Is "2" active customer selected? 
      # # If NO, puts "must select customer from option 2", redirect to main menu.
      if CustomersController.get_active_customer == nil 
        puts "Must select active customer from option 2."
      else
        ProductController.new.update_customer_product_menu  
        # Call the method that will display the prompts for  ... update product information
      end 

    # when "9"  

    # when "10"
      
    # when "11"  
      
      when "12" 
          break
      end 
    end 
  end
end
