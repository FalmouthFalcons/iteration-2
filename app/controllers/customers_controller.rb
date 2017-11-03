require_relative '../models/customer.rb'

class CustomersController 
    attr_accessor :last_name, :first_name, :phone_number, :street_address, :city, :us_state, :zip_code  
    
   
   

    def add_new_customer_menu
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
    end

    def add_new_customer

        
        aCustomer = Customer.new(@last_name, @first_name, @phone_number, @street_address, @city, @us_state, @zip_code )

        aCustomer.create_new_customer
        
    end

    def set_field
         gets.chomp
        
        
    end

end
