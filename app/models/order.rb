class Order < ActiveRecord::Base
  belongs_to :bill
  has_many :order_lines, dependent: :destroy
  
  accepts_nested_attributes_for :order_lines,
    reject_if:lambda {|attr| attr['bio_practice_id'].blank?},
    allow_destroy:true

  validates :bill, presence:true
end
