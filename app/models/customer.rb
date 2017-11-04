
require 'sqlite3'

class Customer


    attr_accessor :id, :last_name, :first_name, :phone_number, :street_address, :city, :us_state, :zip_code
    #intialze that creates customer fields
    def initialize (last_name = nil, first_name = nil, phone_number = nil, street_address = nil, city = nil, us_state = nil, zip_code = nil)
        @last_name = last_name
        @first_name = first_name
        @phone_number = phone_number
        @street_address = street_address
        @city = city
        @us_state = us_state
        @zip_code = zip_code
    end


    # create customer sql

    def create_new_customer
        begin
        db = SQLite3::Database.open(ENV["BANGAZON"])
        db.execute('INSERT INTO customers (last_name, first_name, phone_number, street_address, city, us_state, zip_code) VALUES (?, ?, ?, ?, ?, ?, ?)',[@last_name, @first_name, @phone_number, @street_address, @city, @us_state, @zip_code])
        last_record = db.last_insert_row_id
        db.close
        last_record
        rescue SQLite3::Exception => e
        p "Exception with database query: #{e}"
        end
    end

    # query for all customers

    def get_all_customers
            begin
            db = SQLite3::Database.open(ENV["BANGAZON"])
            array_of_customers = db.execute ("SELECT * FROM customers")
            db.close
            rescue SQLite3::Exception => e
            p "fail to get all customers! #{e}"
            end
        array_of_customers
    end

    # query single customer
    def get_single_customer(single_customer)
            begin
            db = SQLite3::Database.open(ENV["BANGAZON"])
            get_single = db.execute ("SELECT * FROM customers WHERE id = #{single_customer}")
            db.close
            rescue SQLite3::Exception => e
            p "fail to get single customer! #{e}"
            end
        get_single
    end


    # Update customer
    def update_customer(single_customer)
            begin
            db = SQLite3::Database.open(ENV["BANGAZON"])
            update_customer = db.execute(
            "UPDATE customers SET

            last_name = #{single_customer.last_name},
            first_name = #{single_customer.first_name},
            phone_number = #{single_customer.phone_number},
            street_address = #{single_customer.street_address},
            city = #{single_customer.city},
            us_state = #{single_customer.us_state},
            zip_code = #{single_customer.zip_code}

            WHERE id = #{single_customer.id}")

            db.close
            rescue SQLite3::Exception => e
            p "fail to get update customer! #{e}"
            end
        update_customer
    end

end
