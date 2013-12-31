require 'spec_helper'

describe Order do
  describe "Associations" do
    it { should belong_to :bill }
  end

  describe "Validations" do
    it { should validate_presence_of :bill }
  end
end
