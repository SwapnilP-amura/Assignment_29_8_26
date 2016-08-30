class EmployeesController < ApplicationController
  def index
    @employees=Employee.includes(:address).all
  end

end
