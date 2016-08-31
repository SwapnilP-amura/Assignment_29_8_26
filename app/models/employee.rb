class Employee < ActiveRecord::Base

  #validations
  validates :name, format: { with: /\A[a-zA-Z ]+\z/,message: "Alphabets and spaces" }
  validates :phone, uniqueness: {scope: :company,message:"Phone should be unique for each company"}, format: { with: /\d{10}/,message: "Invalid Phone Format,must be 10 digits"}
  validates :email, uniqueness: {scope: :company,message:"Email should be unique for each company"}, format: {with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,message:"Email Format Invalid"}
  validates_numericality_of :salary, greater_than: 0

  #associations
  belongs_to :company
  has_one :address,as: :resource,dependent: :destroy

  def self.top_five()
    Employee.all.select('id,name,salary').order(salary: :desc).limit(5)
  end

  def self.find_by_salary_range(a=10000,b=50000)
    Employee.select('id,name,salary').where(:salary=>(a..b))
  end

  def self.search_by_name(name)
    Employee.joins(:address).where(:name=>name).pluck("name,email,street,city,pincode")
  end

  def self.search_by_address(email)
    Employee.joins(:address).where(:email=>email).pluck("name,email,street,city,pincode")
  end
end
