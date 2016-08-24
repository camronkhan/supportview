class User < ApplicationRecord
  
  # Devise modules - see config/initializers/devise.rb to configure
  devise :database_authenticatable,
  		 :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
end
