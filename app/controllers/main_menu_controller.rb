require_relative 'customers_controller.rb'

class MainMenuController
  def display_main_menu
    # Main menu presented to the user
    puts "*************************************************"
    puts "Welcome to Bangazon! Command Line Ordering System"
    puts "*************************************************"
    puts "1. Create a customer account"
    puts "2. Choose active customer"
    # Add all other options available to the user here.
    puts "12. Leave Bangazon!"

    puts "> "
    user_input = gets.chomp

    case user_input
    when "1"
      # Call the method that will display the prompts for creating a new customer here.
      CustomersController.new.add_new_customer_menu
    when "2"
      # Call the method that will display the prompts for choosing an active customer here.
      CustomersController.new.menu_for_getting_active_customer
    when "3"

    when "4"

    when "5"
    end
  end
end
