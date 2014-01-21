class Bill < ActiveRecord::Base
  has_many :orders

  validates :month, uniqueness:true
  validates :multiplier, numericality: { greater_than_or_equal_to:0 }
  validates :month, :multiplier, presence:true

  def total
    total = 0
    orders.each { |order| total += order.total }
    total
  end
end
