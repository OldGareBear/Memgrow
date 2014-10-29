require 'spec_helper'

describe Card do
  describe "validations" do
    it { should validate_presence_of(:course_id) }
  end

  describe "associations" do
    it { should belong_to(:course) }
  end
end
