require_relative 'customers_controller.rb'
require_relative 'payment_type_controller.rb'
class MainMenuController

  def display_main_menu
    while true 
    # Main menu presented to the user
    puts "*************************************************"
    puts "Welcome to Bangazon! Command Line Ordering System"
    puts "*************************************************"
    puts "1. Create a customer account"
    puts "2. Choose customer to update"
    puts "3. Add a payment type for customer"

    # Add all other options available to the user here.
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
      PaymentTypeController.new.add_payment_type_menu
      # # Is "2" active customer selected? 
      #   PaymentTypeController.new.menu_customer_selected = false  
      # # If NO, puts "must select customer from option 2", redirect to main menu.
      #   puts "You must select a customer from menu option #2 before adding a payment type."
      # elsif 
      # # If YES, Call the method that will display the prompts for adding payment type.
        # PaymentTypeController.new.menu_customer_selected = true

      # Display option to add payment type to active user:  
        
    when "4"

    when "5"
    
      when "12" 
          break
      end
    end 
  end
end
