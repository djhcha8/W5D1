require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the New User template" do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do

    context "with valid params" do
      before(:each) do
        post :create, params: {user: {username: 'test_user', password: 'valid_password'}}
      end

      it "saves the user to the database" do
        user = User.find_by(username: 'test_user')
        expect(user).not_to be(nil)
      end
      it "redirects to the user's private goals page" do
        user = User.find_by(username: 'test_user')
        # debugger
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(user_url(user.id))
      end
    end

    context "with invalid params" do
      before(:each) do
        post :create, params: {user: {username: 'test_user', password: 'v'}}
      end

      it "throws an error" do
        expect(flash[:errors]).to be_present
      end
      it "renders the New User template" do
        expect(response).to render_template(:new)
      end
    end
  end
end
