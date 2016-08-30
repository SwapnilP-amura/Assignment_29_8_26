class CompaniesController < ApplicationController

    def index
      @companies=Company.includes(:address).all
    end

    def new
      @company=Company.new
      #@company.build_address()
    end

    def create
      @c=Company.new(company_params)
      @c.build_address(address_params)

      if @c.save
        redirect_to companies_path
      else
        render 'new'
      end
    end

    def edit
        @company=Company.includes(:address).find(params[:id])
        #render plain: @company.address.inspect
    end

    private
        def company_params
            params.require(:company).permit(:name)
        end

        def address_params
            params.require(:company).require(:address).permit(:street,:city,:pincode)
        end
end
