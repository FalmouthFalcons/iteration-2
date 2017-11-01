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
      # Call the method that will diplay the prompts for creating a new customer here.
    when "2"
      # Call the method that will diplay the prompts for choosing an active customer here.
    end
  end
end
