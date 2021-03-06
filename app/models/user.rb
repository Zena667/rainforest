class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  
  has_many :reviews
  has_many :products, :through => :reviews
end
