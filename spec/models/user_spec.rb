require 'rails_helper'
RSpec.describe User, type: :model do

  let(:user) { create(:user) }


  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:votes) }
  it { is_expected.to have_many(:favorites) }

  describe "attributes" do # Documentation for Shoulda Matchers http://matchers.shoulda.io/docs/v3.1.1/

    it { expect(user).to have_attributes(name: user.name, email: user.email) }

    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:password_digest).of_type(:string) }
    it { should have_db_column(:role).of_type(:integer).with_options({default: 0, null: false}) }
    it { should define_enum_for(:role).with([:member, :admin]) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
  end

  describe 'validations' do

    let(:user_with_invalid_name) { build(:user, name: "") }
    let(:user_with_invalid_email) { build(:user, email: "") }

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

  describe "#favorite_for(post)" do
    before do
      @user = User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld")
      topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
      @post = topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: @user)
    end

    it "returns `nil` if the user has not favorited the post" do
      expect(@user.favorite_for(@post)).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      favorite = @user.favorites.where(post: @post).create
      expect(@user.favorite_for(@post)).to eq(favorite)
    end
  end

  describe ".avatar_url" do
    let(:known_user) { create(:user, email: "blochead@bloc.io") }

    it "returns the proper Gravatar url for a known email entity" do
      expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"
      expect(known_user.avatar_url(48)).to eq(expected_gravatar)
    end
  end

  describe "#generate_auth_token" do
    it "creates a token" do
      expect(user.auth_token).to_not be_nil
    end
  end

end
