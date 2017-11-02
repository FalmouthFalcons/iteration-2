require 'minitest/autorun'
require_relative '../../app/controllers/customers_controller.rb'

class CustomersControllerTest < Minitest::Test

    def setup
        @customersController = CustomersController.new
        @customersController.last_name = "Anderson"
        @customersController.first_name = "John"
        @customersController.phone_number = "123-234-3333"
        @customersController.street_address = "123 Elm"
        @customersController.city = "Nashville"
        @customersController.us_state = "TN"
        @customersController.zip_code = "23456"

        
    end


    def test_add_customer_last_name
        assert_equal @customersController.last_name,  "Anderson"
    end

    def test_add_customer_first_name
        assert_equal @customersController.first_name,  "John"
    end

    def test_add_customer_phone_number
        assert_equal @customersController.phone_number,  "123-234-3333"
    end


    def test_add_customer_street_address
        assert_equal @customersController.street_address, "123 Elm"
    end


    def test_add_customer_city
        assert_equal @customersController.city,  "Nashville"
    end

    def test_add_customer_us_state
        assert_equal @customersController.us_state,  "TN"
    end

    def test_add_customer_zip_code
        assert_equal @customersController.zip_code,  "23456"
    end


    def test_add_new_customer
        new_customer = @customersController.add_new_customer
        assert_operator(new_customer, :>, 0)
        
    end

end
