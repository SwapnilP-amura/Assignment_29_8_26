class EmployeesController < ApplicationController
  def index
    @employees=Employee.includes(:address).all
  end

  def new
    @employee=Employee.new
  end

  def create
    @employee=Employee.new(employee_params)
    @employee.build_address(address_params)
    render plain: @employee.address.inspect
    if @employee.save
      #redirect_to employees_path
    else
      #render 'new'
    end
  end

  private

    def employee_params
      params.require(:employee).permit(:name,:email,:phone,:salary,:designation)
    end

    def address_params
      params.require(:employee).require(:address).permit(:street,:city,:pincode)
    end


end
