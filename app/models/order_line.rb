class OrderLine < ActiveRecord::Base
  belongs_to :order
  belongs_to :bio_practice

  validates :bio_practice, uniqueness: { scope: [:order_id, :bio_practice_id] }

  def total
    return 0 unless bio_practice
    bio_practice.ub
  end
end
