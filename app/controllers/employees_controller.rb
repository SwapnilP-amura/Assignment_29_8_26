class EmployeesController < ApplicationController

  before_action :get_employee ,only: [:show,:edit,:destroy,:update]
  before_action :get_company ,only: [:index,:new,:create]
  def index
     #@company=Company.find(params[:company_id])
     @employees=@company.employees
  end

  def new
    #@company=Company.find(params[:company_id])
  end

  def show
      #@employee=Employee.find(params[:id])
  end

  def edit
      #@employee=Employee.find(params[:id])
  end

  def create
      @company=Company.find(params[:company_id])
      @employee=@company.employees.new(employee_params)
      @employee.build_address(address_params)

     if @employee.save
        redirect_to company_employees_path(@company)
      else
        redirect_to new_company_employee_path(@company)
      end
  end

  def update
      #@employee = Employee.find(params[:id])
      if @employee.update(employee_params) and @employee.address.update(address_params)
        redirect_to company_employees_path(@employee.company)
      else
        render 'edit'
      end
  end

  def destroy
      #@employee=Employee.find(params[:id])
      @employee.destroy
      redirect_to company_employees_path(@employee.company)
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

    def get_company
      @company=Company.find(params[:company_id])
    end
end
