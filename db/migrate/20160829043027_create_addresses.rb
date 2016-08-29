class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.integer :pincode
      t.references :resource, index: true, polymorphic: true

      t.timestamps null: false
    end
  end
end
