class CompaniesController < ApplicationController

    def show
      @companies=Company.includes(:address).all
    end

    def new
      @company=Company.new
    end

    def create
      @c=Company.new(company_params)
      @c.build_address(address_params)

      if @c.save
        redirect_to company_path
      else
        render 'new'
      end

    end

    private
        def company_params
            params.require(:company).permit(:name)
        end

        def address_params
            params.require(:company).require(:address).permit(:street,:city,:pincode)
        end
end
