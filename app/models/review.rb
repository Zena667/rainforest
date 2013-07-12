class Review < ActiveRecord::Base
  attr_accessible :comment, :product_id, :user_id

  belongs_to :user
  belongs_to :product

  validates_presence_of :comment
  validates_uniqueness_of :user_id
end
