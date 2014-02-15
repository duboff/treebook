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
  								with: /[a-zA-Z0-9_-]+/,
  								message: "Must be formatted currectly."
  							}



  def full_name
  	first_name + ' ' + last_name
  end

  def gravatar_url
  	hash = Digest::MD5.hexdigest(email.strip.downcase)
  	"http://gravatar.com/avatar/#{hash}"
  end
end
