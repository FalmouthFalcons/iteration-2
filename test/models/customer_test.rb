require 'minitest/autorun'
require_relative '../../app/models/customer.rb'


class CustomerTest < Minitest::Test

        #setup
        def setup
                begin
                @customer = Customer.new("last_name", "first_name", "phone_number", "street_address", "city", "us_state", "zip_code")
                @new_customer = @customer.create_new_customer
                @customer.id = @new_customer
                rescue SQLite3::Exception => e
                p "Exception with database query: #{e}"
                end
        end

        #Test for instance intialize that creates customer fields
        def test_initialize
                begin
                assert_raises ArgumentError do
                        Customer.new
                end
                rescue SQLite3::Exception => e
                p "Exception with database query: #{e}"
                end
        end

        def test_initialize_with_arguments
                begin
                assert_instance_of Customer, Customer.new("arg2", "arg3", "arg4", "arg5", "arg6", "arg7", "arg8")
                rescue SQLite3::Exception => e
                p "Exception with database query: #{e}"
                end
        end




        # Test create customer sql
        def test_create_customer_sql
                begin
                #start query for customer we haven't added
                new_customer_id = @customer.create_new_customer
                #query to find customr that was just added
                assert_operator(new_customer_id, :>, 0)
                #assert something was brought back the same
                rescue SQLite3::Exception => e
                p "Exception with database query: #{e}"
                end
        end

        # Test customer database integration
        def test_customer_database_integration
                db = SQLite3::Database.open(ENV["BANGAZON"])
                test_nil_customer = db.execute('SELECT * FROM CUSTOMERS WHERE first_name = "Brooke";')
                assert_empty test_nil_customer
                test_added_customer = Customer.new("last_name", "Brooke", "phone_number", "street_address", "city", "us_state", "zip_code").create_new_customer
                add_cust_integration = @customer.get_single_customer(test_added_customer)
                assert_equal "Brooke", add_cust_integration[0][2]
                db.close
        end

        # Test query for all customers
        def test_all_customers
                begin
                all_customers = @customer.get_all_customers
                assert_instance_of(Array, all_customers)
                rescue SQLite3::Exception => e
                p "Exception with database query: #{e}"
                end
        end

        # Test query single customer
        def test_single_customer
                begin
                # add customer to database before it passed
                single_customer = @customer.get_single_customer(1)
                assert_instance_of(Array, single_customer)
                rescue SQLite3::Exception => e
                p "Exception with database query: #{e}"
                end
        end


        # Test Update customer
        def test_update_customer
                begin
                update_customer = @customer.update_customer(@customer)
                assert_instance_of(Array, update_customer)
                rescue SQLite3::Exception => e
                p "Exception with database query: #{e}"
                end
        end

        def teardown
                db = SQLite3::Database.open(ENV["BANGAZON"])
                db.execute("DELETE FROM customers")
                db.close
        end

end

# test
# test
