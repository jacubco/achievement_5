require 'rails_helper'

describe User do 

  context "email and password present" do
    let(:user) { User.new(email: "john@smith.com", password: "123456")}
    

    it "returns email and password" do
      expect(user.email).to eq "john@smith.com"
      expect(user.password).to eq "123456"
    end

    it "is not valid without an email" do
      expect(User.new(email: "", password: "123456")).not_to be_valid
    end
  

  end

  
end