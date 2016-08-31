class EmployeesController < ApplicationController

  before_action :get_employee ,only: [:show,:edit,:destroy,:update]

  def index
    @employees=Employee.all
  end

  def new
    @employee=Employee.new
  end

  def show
      #@employee=Employee.find(params[:id])
  end

  def edit
      #@employee=Employee.find(params[:id])
      #render plain: params
  end

  def create
    @employee=Employee.new(employee_params)
    @employee.build_address(address_params)

    if @employee.save
      redirect_to employees_path
    else
      render 'new'
    end
  end

  def update
    #@employee = Employee.find(params[:id])
      if @employee.update(employee_params) and @employee.address.update(address_params)
        redirect_to employee_path
      else
        render 'edit'
      end
  end

  def destroy
      #@employee=Employee.find(params[:id])
      @employee.destroy
      redirect_to employees_path
  end


  private
    def employee_params
      params.require(:employee).permit(:name,:email,:phone,:salary,:designation)
    end

    def address_params
      params.require(:employee).require(:address).permit(:street,:city,:pincode)
    end

    def get_employee
      @employee=Employee.find(params[:id])
    end

end
