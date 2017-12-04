require 'rails_helper'
require 'byebug'

RSpec.describe User, type: :model do

  describe 'User' do
    context 'Validations' do

      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:password_digest) }
      it { should validate_presence_of(:session_token) }
      it { should validate_length_of(:password).is_at_least(6) }

    end

    context '::find_by_credentials' do
      before(:each) do
        User.create(username: "test_user", password: "valid_password")
      end

      it "should return a user when passed valid credentials" do
        user = User.find_by(username: "test_user")
        expect(User.find_by_credentials("test_user", "valid_password")).to eq(user)
      end


      it "should not return a user when passed invalid credentials" do
        expect(User.find_by_credentials("test_user", "invalid_password")).to eq(nil)
      end

    end

  end

end
