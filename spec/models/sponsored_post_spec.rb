require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do

  describe "attributes" do # Documentation for Shoulda Matchers http://matchers.shoulda.io/docs/v3.1.1/
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:price).of_type(:integer) }
  end
  
  describe 'associations' do
    it { should belong_to(:topic) }
  end
end
