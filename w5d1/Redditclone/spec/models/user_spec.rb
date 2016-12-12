require 'rails_helper'

begin
    User
    rescue
    User = nil
end


RSpec.describe User, type: :model do

  subject(:user) do
    FactoryGirl.build(:user,
      name: "jonathan",
      password: "good_password")
  end

  it "creates password_digests using bcrypt" do
    expect(:password_digest).not_to be_nil
  end

  it "checks a password against the password digest" do
    user = User.create!(username: "username", password:"abcdefg")
    expect(user.is_password?("abcdefg").to be_truthy)
  end

  it "creates a session token before validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#reset_session_token!" do
  it "sets a new session token on the user" do
    user.valid?
    old_session_token = user.session_token
    user.reset_session_token!

    expect(user.session_token).to_not eq(old_session_token)
  end

  it "returns the new session token" do
    expect(user.reset_session_token!).to eq(user.session_token)
  end
end

describe "#is_password?" do
  it "verifies a password is correct" do
    expect(user.is_password?("good_password")).to be true
  end

  it "verifies a password is not correct" do
    expect(user.is_password?("bad_password")).to be false
  end
end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user given good credentials" do
      expect(User.find_by_credentials("jonathan", "good_password")).to eq(user)
  end

  it "returns nil given bad credentials" do
    expect(User.find_by_credentials("jonathan", "bad_password")).to eq(nil)
  end
end


  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_length_of(:password).at_least(6)}
  it {should have_many(:subs)}
  it {should have_many(:user_voters)}
  it {should have_many(:comments)}
end
