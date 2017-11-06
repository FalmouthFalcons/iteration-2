require 'minitest/autorun'
require_relative '../../app/models/payment_type.rb'
require_relative '../../app/models/customer.rb'

class PaymentTypeTest < Minitest::Test

        #setup
        def setup

                @customer = Customer.new("last_name", "first_name", "phone_number", "street_address", "city", "us_state", "zip_code").create_new_customer
                @payment_type = PaymentType.new("payment_type", "account_number", @customer)
                @new_payment = @payment_type.create_new_payment_type                         
                @payment_type.id = @new_payment

        end

        #Test for instance intialize that creates Payment fields
        def test_initialize
                # begin
                assert_instance_of PaymentType, PaymentType.new
        end 

        # Test create Payment sql
        def test_create_payment_sql     
                
                new_payment_id = @payment_type.create_new_payment_type
                assert_operator(new_payment_id, :>, 0)
        end 

end
 