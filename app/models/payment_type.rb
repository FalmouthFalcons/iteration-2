require 'sqlite3'
require_relative 'customer.rb'

class PaymentType
    
        attr_accessor :payment_type, :account_number, :id
        #initialize that creates payment fields
        def initialize(payment_type = nil , account_number = nil, customer = nil)
                @customer = customer
                @payment_type = payment_type
                @account_number = account_number
        end
    
        def create_new_payment_type
                db = SQLite3::Database.open(ENV["BANGAZON"])
                db.execute('INSERT into payment_types (payment_type, account_number, customer_id) VALUES (?,?,?)',[@payment_type, @account_number, @customer])
                
                last_record = db.last_insert_row_id
                db.close     
                last_record
        end
end 

        # create payment sql (confirmation)