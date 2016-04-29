require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "attributes" do # Documentation for Shoulda Matchers http://matchers.shoulda.io/docs/v3.1.1/
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:title).of_type(:string) }
  end
  
  describe 'associations' do
    it { should have_many(:comments) }
  end
end
