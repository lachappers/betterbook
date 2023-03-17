require 'rails_helper'

RSpec.describe "Users", type: :request do

    context 'when logged in' do
        before(:each) do
            @user = create(:user)
            sign_in(@user)
        end

        it "redirects to dashboard" do
            # get '/'
            get root_path
            expect(response).to have_http_status(:success)
          end

    end

    context 'when not logged in' do
        it "redirects to login" do
            get root_path
            expect(response).to redirect_to :new_user_session
          end
    end
end