class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, :through => :reviews
  attr_accessible :description, :name, :price_in_cents

  validates :description, :name, :presence => true
  validates :price_in_cents, :numericality => {:only_integer => true}

# def dollar_convert
#   number_to_currency(@product[:price_in_cents].to_f/100)
# end  

end



