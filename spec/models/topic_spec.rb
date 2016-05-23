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

  describe "scopes" do
    before do
      @public_topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
      @private_topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph, public: false)
    end

    describe "visible_to(user)" do
      it "returns all topics if the user is present" do
        user = User.new
        expect(Topic.visible_to(user)).to eq(Topic.all)
      end

      it "returns only public topics if user is nil" do
        expect(Topic.visible_to(nil)).to eq([@public_topic])
      end
    end
  end
end
