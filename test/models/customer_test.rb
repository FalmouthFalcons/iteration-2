require 'minitest/autorun'
require_relative '../../app/models/customer.rb'


class CustomerTest < Minitest::Test
    
        #setup model class with table attributes
        def setup
                begin
                @customer = Customer.new("last_name", "first_name", "phone_number", "street_address", "city", "us_state", "zip_code")
                @new_customer = @customer.create_new_customer
                @customer.id = @new_customer
                rescue SQLite3::Exception => e
                p "Exception with setup: #{e}"
                end
        end

        #Test for intialize which creates customer fields
        def test_initialize
                begin
                assert_raises ArgumentError do
                        Customer.new
                end
                rescue SQLite3::Exception => e
                p "Exception with test_initialize: #{e}"
                end
        end

        # Test for initialized class with arguments
        def test_initialize_with_arguments
                begin
                assert_instance_of Customer, Customer.new("arg2", "arg3", "arg4", "arg5", "arg6", "arg7", "arg8")
                rescue SQLite3::Exception => e
                p "Exception with test_initialize_with_arguments: #{e}"
                end
        end

        # Test for existence of customer created with sql
        def test_create_customer_sql
                begin
                new_customer_id = @customer.create_new_customer
                # test returns id > 0
                assert_operator(new_customer_id, :>, 0)
                rescue SQLite3::Exception => e
                p "Exception with test_create_customer_sql: #{e}"
                end
        end
    
        # Test db query for all customers
        def test_all_customers
                begin
                all_customers = @customer.get_all_customers
                # test returns array
                assert_instance_of(Array, all_customers)
                rescue SQLite3::Exception => e
                p "Exception with test_all_customers: #{e}"
                end
        end
    
        # Test db query single customer
        def test_single_customer
                begin
                single_customer = @customer.get_single_customer(1)
                # test returns array
                assert_instance_of(Array, single_customer)
                rescue SQLite3::Exception => e
                p "Exception with test_single_customer: #{e}"
                end
        end


        # Test update customer in db
        def test_update_customer
                begin
                update_customer = @customer.update_customer(@customer)
                # test returns array
                assert_instance_of(Array, update_customer)
                rescue SQLite3::Exception => e
                p "Exception with test_update_customer: #{e}"
                end
        end
    
end