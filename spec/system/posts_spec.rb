require 'rails_helper'

RSpec.describe Post, type: :system do
   
    before(:each) do
        @user = create(:user)
        login_as(@user)
        visit root_path
        # add steps to create post
    end

    context 'when created by user' do
        it 'is created sucessfully' do

        end
    end

    context 'when displayed' do
        it 'shows content, author, comments and likes' do

        end
    end

    describe '.index' do
        it 'shows recent posts from current user and friends' do

        end
    end

    describe '.create' do
        it 'can be text or an image' do
            
        end
    end
end