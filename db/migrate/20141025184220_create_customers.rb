class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :firstname
      t.string :lastname
      t.string :street
      t.string :state
      t.string :zip
      t.string :country

      t.timestamps null: false
    end
  end
end
