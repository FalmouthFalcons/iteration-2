require 'minitest/autorun'
require_relative '../../app/controllers/customers_controller.rb'

class CustomersControllerTest < Minitest::Test

    def setup
        begin
        @customersController = CustomersController.new
        @customersController.last_name = "Anderson"
        @customersController.first_name = "John"
        @customersController.phone_number = "123-234-3333"
        @customersController.street_address = "123 Elm"
        @customersController.city = "Nashville"
        @customersController.us_state = "TN"
        @customersController.zip_code = "23456"
        rescue SQLite3::Exception => e
        p "Exception with database query: #{e}"
        end
        
    end


    def test_add_customer_last_name
        begin
        assert_equal @customersController.last_name,  "Anderson"
        rescue SQLite3::Exception => e
        p "Exception with database query: #{e}"
        end
    end

    def test_add_customer_first_name
        begin
        assert_equal @customersController.first_name,  "John"
        rescue SQLite3::Exception => e
        p "Exception with database query: #{e}"
        end
    end

    def test_add_customer_phone_number
        begin
        assert_equal @customersController.phone_number,  "123-234-3333"
        rescue SQLite3::Exception => e
        p "Exception with database query: #{e}"
        end
    end


    def test_add_customer_street_address
        begin
        assert_equal @customersController.street_address, "123 Elm"
        rescue SQLite3::Exception => e
        p "Exception with database query: #{e}"
        end
    end


    def test_add_customer_city
        begin
        assert_equal @customersController.city,  "Nashville"
        rescue SQLite3::Exception => e
        p "Exception with database query: #{e}"
        end
    end

    def test_add_customer_us_state
        begin
        assert_equal @customersController.us_state,  "TN"
        rescue SQLite3::Exception => e
        p "Exception with database query: #{e}"
        end
    end

    def test_add_customer_zip_code
        begin
        assert_equal @customersController.zip_code,  "23456"
        rescue SQLite3::Exception => e
        p "Exception with database query: #{e}"
        end
    end


    def test_add_new_customer
        begin
        new_customer = @customersController.add_new_customer
        assert_operator(new_customer, :>, 0)
        rescue SQLite3::Exception => e
        p "Exception with database query: #{e}"
        end
        
    end

    # This is the tests for Ticket #2

    # Write test for set active method
    def test_set_and_get_active_customer
        CustomersController.set_active_customer(1)
       returned_active_customer =  CustomersController.get_active_customer
       assert_equal 1, returned_active_customer
    end


end
