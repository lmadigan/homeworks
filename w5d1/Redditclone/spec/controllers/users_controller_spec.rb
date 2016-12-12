require 'rails_helper'

begin
  UsersController
rescue
  UsersController = nil
end


RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
   it "renders the new template" do
     get :new, {}
     expect(response).to render_template("new")
   end
 end

 describe "POST #create" do
   context "with invalid params" do
    it "validates the presence of the user's username and password" do
      post :create, user: {username: "username", password: ""}
      expect(flash[:errors]).to be_present
    end
    it "validates that the password is at least 6 characters long" do
      post :create, user: {username: "username", password: "hi"}
      expect(flash[:errors]).to be_present
   end
 end

   context "with valid params" do
     it "redirects user to links index on success" do
       post :create, user: {username: "username", password: "hihihihi"}
       expect(response).to redirect_to(links_url)
     end
   end

 end

end
