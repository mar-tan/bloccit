require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe "attributes" do # Documentation for Shoulda Matchers http://matchers.shoulda.io/docs/v3.1.1/
    it { should have_db_column(:body).of_type(:text) }
  end
  
  describe 'associations' do
    it { should belong_to(:post) }
  end
end
