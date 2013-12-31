class Order < ActiveRecord::Base
  belongs_to :bill

  validates :bill, presence:true
end
