class EmployeesController < ApplicationController
  def show
    @employees=Employee.includes(:address).all
  end

end
