require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  # subject { User.current_user } 
  describe 'authentication status verification' do
    context "when user is not logged in" do
      it "redirects user to login screen" do
        visit root_path
        expect(response).to redirect_to :new_user_session
      end
    end

    context 'when user is logged in' do
      it 'redirects user to dashboard' do
        visit root_path
        expect(response).to redirect_to :root_path
      end
    end
  end
end
