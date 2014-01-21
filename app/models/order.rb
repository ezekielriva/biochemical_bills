class Order < ActiveRecord::Base
  belongs_to :bill
  has_many :order_lines, dependent: :destroy
  
  accepts_nested_attributes_for :order_lines,
    reject_if:lambda {|attr| attr['bio_practice_id'].blank?},
    allow_destroy:true

  validates :bill, :patient_no, :patient_name, presence:true

  def total
    total = 0
    order_lines.each do |item|
      total += item.total
    end
    total * bill.multiplier
  end
end
