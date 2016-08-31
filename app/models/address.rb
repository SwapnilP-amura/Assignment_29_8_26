class Address < ActiveRecord::Base
  belongs_to :resource, polymorphic: true

  def self.find_employees_by_city(city)
    Address.where(:city=>city,:resource_type=>"Employee").map(&:resource)
  end

  def self.find_employees_by_city_2(city)
    Employee.includes(:address).where(addresses:{city:city})
  end

end
