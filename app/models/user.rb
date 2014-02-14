class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :first_name, :last_name, :profile_name, :password

  has_many :statuses

  validates :first_name, presence: true

  validates :last_name, presence: true
  
  validates :profile_name, presence: true,
  							uniqueness: true,
  							format: {
  								with: /\A[a-zA-Z\-\_]+\Z/,
  								message: "Must be formatted currectly."
  							}



  def full_name
  	first_name + ' ' + last_name
  end
end