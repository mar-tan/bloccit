require 'rails_helper'

RSpec.describe User, type: :model do

  describe "attributes" do # Documentation for Shoulda Matchers http://matchers.shoulda.io/docs/v3.1.1/
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:password_digest).of_type(:string) }
    it { should have_db_column(:role).of_type(:integer).with_options({default: 0, null: false}) }
    it { should define_enum_for(:role).with([:member, :admin]) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:posts) }
  end
  
  describe 'validations' do
    # name
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(1) }
    # email
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_length_of(:email).is_at_least(3) }
    it { is_expected.to allow_value("user@bloccit.com").for(:email) }
    # password
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end

end
