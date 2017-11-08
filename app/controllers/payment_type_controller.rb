require_relative '../../app/models/payment_type.rb'
require_relative '../../app/models/customer.rb'


class PaymentTypeController 
    
    attr_accessor :payment_type, :account_number

        
    # Method for customer to add a payment type via CLI: 
    def add_payment_type_menu

        puts "Enter payment type (e.g. AmEx, Visa, Checking):"
        puts ">" 
        @payment_type = set_field
        
        puts "Enter account number:"
        puts ">"
        @account_number = set_field
        
        puts "Success: payment type: #{payment_type} and account number: #{account_number} have been added to customer: #{Customer.customer_id}"
    end 

    # Captures the user input from CLI
    def set_field
            gets.chomp 
            end 


    # And when complete, the payment type should be added for the active customer
    def add_payment_type
            addPaymentType = PaymentType.new(@payment_type, @account_number)
            # pass customer id?
    end

end



# REQUIREMENTS:
    # Given a customer has been made active in the program
    # When the user selects the option to add a payment type
    # Then the user should be prompted to enter in all appropriate information for a payment type
    # And when complete, the payment type should be added for the active customer
    
    # Enter payment type (e.g. AmEx, Visa, Checking)
    
    # Enter account number