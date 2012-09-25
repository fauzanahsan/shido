class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :phone, :fullname, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  has_many :orders
  has_many :businesses
end
