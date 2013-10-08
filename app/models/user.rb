# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  email      :string(255)
#  senha      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :nome, :password, :password_confirmation

  has_secure_password
  
  before_save { self.email = email.downcase }

  validates :nome, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, 
  			format: { with: VALID_EMAIL_REGEX }, 
  			uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true


end
