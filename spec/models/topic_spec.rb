require 'rails_helper'

RSpec.describe Topic, type: :model do

  let(:topic) { create(:topic) }

  describe "attributes" do # Documentation for Shoulda Matchers http://matchers.shoulda.io/docs/v3.1.1/
    it "responds to name and description attributes" do
      expect(topic).to have_attributes(name: topic.name, description: topic.description)
    end
    it { should have_db_column(:public).of_type(:boolean).with_options({default: true, null: false}) }
  end

  describe 'associations' do
    it { should have_many(:posts).dependent(:destroy) }
  end
end
