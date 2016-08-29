class AddIndexToEmployee < ActiveRecord::Migration
  def change
    add_index :employees,[:company_id,:email]
    add_index :employees,[:company_id,:phone]
  end
end
