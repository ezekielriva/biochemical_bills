require "spec_helper"

describe Bill do
  describe "Associations" do
    it { should have_many :orders }
  end
  describe "Validations" do
    it { should validate_presence_of(:multiplier) }
    it { should validate_numericality_of(:multiplier) }
    it { should validate_numericality_of(:multiplier).is_greater_than_or_equal_to(0) }
    it { should validate_presence_of(:month) }
    it { should validate_uniqueness_of(:month) }
  end
end