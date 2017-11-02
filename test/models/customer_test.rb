require 'minitest/autorun'
require_relative '../../app/models/customer.rb'


class CustomerTest < Minitest::Test
    
        #setup
        def setup
                @customer = Customer.new("last_name", "first_name", "phone_number", "street_address", "city", "us_state", "zip_code")
                @new_customer = @customer.create_new_customer
                @customer.id = @new_customer
        end

        #Test for instance intialize that creates customer fields
        def test_initialize
                assert_raises ArgumentError do
                        Customer.new
                end
        end

        def test_initialize_with_arguments
                assert_instance_of Customer, Customer.new("arg2", "arg3", "arg4", "arg5", "arg6", "arg7", "arg8")
        end



        
        # Test create customer sql
        def test_create_customer_sql
                new_customer_id = @customer.create_new_customer
                assert_operator(new_customer_id, :>, 0)
        end
    
        # Test query for all customers
        def test_all_customers
                all_customers = @customer.get_all_customers
                assert_instance_of(Array, all_customers)
        end
    
        # Test query single customer
        def test_single_customer
                # add customer to database before it passed
                single_customer = @customer.get_single_customer(1)
                assert_instance_of(Array, single_customer)
        end
        # Test Update customer
        def test_update_customer
                update_customer = @customer.update_customer(@customer)
                assert_instance_of(Array, update_customer)
        end
    
end