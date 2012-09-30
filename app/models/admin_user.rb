class AdminUser < ActiveRecord::Base
  rolify :role_cname => 'AdminRole'
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  ROLES = ["Admin", "Sales", "Account Manager"]
  
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids #, :as => :admin
  # attr_accessible :title, :body
  
  def account_manager
    self.has_role? ("Account Manager")
  end
end
