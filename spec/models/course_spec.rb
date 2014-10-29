require 'spec_helper'

describe Course do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:author_id) }
  end

  describe "associations" do
    it { should have_many(:cards) }
    it { should have_many(:users) }
  end
end
