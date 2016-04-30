require 'rails_helper'

RSpec.describe Question, type: :model do

  describe "attributes" do # Documentation for Shoulda Matchers http://matchers.shoulda.io/docs/v3.1.1/
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:resolved).of_type(:boolean) }
  end

end
