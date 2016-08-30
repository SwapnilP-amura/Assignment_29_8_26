class CompaniesController < ApplicationController

    def show
      @companies=Company.includes(:address).all
    end

    

end
