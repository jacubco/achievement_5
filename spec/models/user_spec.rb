require 'rails_helper'

describe User do 

  context "email and password present" do
    # let(:user) { User.new(email: "john@smith.com", password: "123456")}
    user = FactoryBot.create(:user, email: "john@doe2.com")

    # @user = User.create!(email: "john@smith.com", password: "123456")

    it "returns email and password" do
      expect(user.email).to eq "john@doe2.com"
      expect(user.password).to eq "123456"
    end

    it "is not valid without an email" do
      expect(User.new(email: "", password: "123456")).not_to be_valid
    end

    # Example from exercise 6.4
    # Essentially doing the same as test above
    it "should not validate users without an email address" do
      @user = FactoryBot.build(:user, email: "not_an_email")
      expect(@user).to_not be_valid
    end
  

  end

  
end