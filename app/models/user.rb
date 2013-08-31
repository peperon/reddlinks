class User < ActiveRecord::Base
  attr_accessible :name, :password_digest, :password, :password_confirmation

  validates :name, presence: true, uniqueness: true
  has_secure_password

  has_many :links
  has_many :communities

  def self.authenticate(name, password)
    user = User.find_by_name name

    if user and user.authenticate(password) 
      user
    else
      nil  
    end
  end
end
