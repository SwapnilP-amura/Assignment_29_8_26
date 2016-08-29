class AddSalaryToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :salary, :integer
  end
end
