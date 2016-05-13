require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "attributes" do # Documentation for Shoulda Matchers http://matchers.shoulda.io/docs/v3.1.1/
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:title).of_type(:string) }
  end
  
  describe 'associations' do
    it { should have_many(:comments).dependent(:destroy) }
    it { should belong_to(:topic) }
  end
  
  describe 'validations' do
    # title  
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(5) }
    # body
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(20) }
    # topic
    it { should validate_presence_of(:topic) }
  end

end
