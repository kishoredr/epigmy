class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
    	t.integer :customer_unique_number, :limit => 8
    	t.integer :account_number, :limit => 10
    	t.string :account_type
    	t.integer :loan_account_number, :limit => 8
    	t.string :customer_name
    	t.string :customer_gender
    	t.text :customer_address
    	t.string :customer_phone_number
    	t.string :customer_alternate_phone_number
    	t.string :customer_email_id
    	t.date :customer_date_of_birth
    	t.string :nominee_name
    	t.string :nominee_relation
    	t.date :nominee_date_of_birth
    	t.text :nominee_address
    	t.integer :account_balance, :limit => 10
    	t.date :account_create_date 
    	t.boolean :active_class

      t.timestamps null: false
    end
  end
end
