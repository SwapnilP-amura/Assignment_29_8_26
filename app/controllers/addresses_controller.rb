class AddressesController < ApplicationController
  def show
    @addresses=Address.all
  end
end
