class CompaniesController < ApplicationController

    before_action :get_company ,only: [:show,:edit,:destroy]

    def index
      @companies=Company.includes(:address).all
    end

    def new
      @company=Company.new
      #@company.build_address()
    end

    def show
        #@company=Company.includes(:address).find(params[:id])
    end

    def edit
        #@company=Company.includes(:address).find(params[:id])
        #render plain: params
    end

    def create
      @company=Company.new(company_params)
      @company.build_address(address_params)

      if @company.save
        redirect_to companies_path
      else
        render 'new'
      end
    end

    def update
      @company = Company.find(params[:id])
        if @company.update(company_params)
          redirect_to company_path
        else
          render 'edit'
        end
    end

    def destroy
        #@company=Company.includes(:address).find(params[:id])
        @company.destroy
        redirect_to companies_path
    end

    private
        def company_params
            params.require(:company).permit(:name)
        end

        def address_params
            params.require(:company).require(:address).permit(:street,:city,:pincode)
        end

        def get_company
          #refactoring
          @company=Company.includes(:address).find(params[:id])
        end
end
