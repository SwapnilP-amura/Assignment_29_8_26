class Employee < ActiveRecord::Base

  #validations
  validates :name, format: { with: /\A[a-zA-Z ]+\z/,message: "Alphabets and spaces" }
  validates :phone, uniqueness:true , format: { with: /\d{10}/,message: "Invalid Phone Format,must be 10 digits"}
  validates :email, uniqueness: true, format: {with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,message:"Email Format Invalid"}
  validates_numericality_of :min_age, greater_than: 0

  #associations
  belongs_to :company
  has_one :address,as: :resource
end
