require 'minitest/autorun'
require_relative '../../app/controllers/payment_type_controller.rb'
require_relative '../../app/controllers/customers_controller.rb'

class PaymentTypeControllerTest < Minitest::Test
    
    def setup 
        @paymentTypeController = PaymentTypeController.new 
        @paymentTypeController.payment_type = "MasterCard"
        @paymentTypeController.account_number = "987654321000"
    end 

    def test_add_payment_type
        assert_equal @paymentTypeController.payment_type, "MasterCard"
    end 

    def test_add_account_number
        assert_equal @paymentTypeController.account_number, "987654321000"
    end 

end



