require 'rails_helper'

RSpec.describe Topic, type: :model do

  describe "attributes" do # Documentation for Shoulda Matchers http://matchers.shoulda.io/docs/v3.1.1/
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:public).of_type(:boolean).with_options({default: true, null: false}) }
  end
  
  describe 'associations' do
    it { should have_many(:posts).dependent(:destroy) }
  end
end
