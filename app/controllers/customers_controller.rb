require_relative '../models/customer.rb'

class CustomersController

    attr_accessor :last_name, :first_name, :phone_number, :street_address, :city, :us_state, :zip_code

    # Method creates CLI menu to add customer
    def add_new_customer_menu
        begin
        puts "Enter customer first name: "
        p ">"
        @first_name = set_field

        puts "Enter customer last name: "
        p ">"
        @last_name = set_field

        puts "Enter Phone Number: "
        p ">"
        @phone_number = set_field

        puts "Enter street address: "
        p ">"
        @street_address = set_field

        puts "Enter City: "
        p ">"
        @city = set_field

        puts "Enter State: "
        p ">"
        @us_state = set_field

        puts "Enter Zip code: "
        p ">"
        @zip_code = set_field

        add_new_customer
        rescue SQLite3::Exception => e
        p "Exception with add_new_customer_menu: #{e}"
        end
    end

    # Method calls model method and create new customer in db
    def add_new_customer
        begin
        aCustomer = Customer.new(@last_name, @first_name, @phone_number, @street_address, @city, @us_state, @zip_code )
        aCustomer.create_new_customer
        rescue SQLite3::Exception => e
        p "Exception with add_new_customer: #{e}"
        end
    end

    # Method sets value of column fields in customer table based on 
    # input from add_new_customer_menu, CLI input
    def set_field
        begin
        gets.chomp
        rescue SQLite3::Exception => e
        p "Exception with set_field: #{e}"
        end
    end

    # This is the beggining of Issue #2 - set active customer

    # Method set the active user based on CLI input using customer id
    def self.set_active_customer(customer_id)
        begin
        @@customer_active = customer_id
        rescue SQLite3::Exception => e
        p "Exception with set_active_customer: #{e}"
        end
    end

    # This is getting the active customer ("return" is not needed, but looks nice)
    def self.get_active_customer
        return @@customer_active
    end

    # We are refering to the method that will get all customers, and then display them on the CLI menu when set active customer is selected
    def menu_for_getting_active_customer
        begin
        list_of_customers = Customer.new.get_all_customers
        puts "Which customer will be active?"
        list_of_customers.each_with_index do |customer, index|
            puts "#{index+1}. #{customer[2]} #{customer[1]}"
        end
        #Capture user input for customer_id #; provide confirmation of selected customer 
        selected_customer = gets.chomp
        active_customer = list_of_customers[(selected_customer.to_i - 1)]
            puts "Selected Customer: #{active_customer[2]} #{active_customer[1]}"
        
        self.class.set_active_customer(active_customer[0])    

        rescue SQLite3::Exception => e
        p "Exception with menu_for_getting_active_customer: #{e}"
        end 
    end
end