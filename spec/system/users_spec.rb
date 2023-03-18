require 'rails_helper'

RSpec.describe User, type: :system do
   
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
        it 'shows all users' do

        end
        context 'if not a friend' do
            it 'shows friend request button' do

            end
        end

        context 'if pending friend request' do
            it 'shows friend pending button' do

            end
        end

        context 'if friend' do
            it 'shows you are friends' do

            end
        end
    end

    describe '.show' do
        it 'shows user profile' do
            
        end
    end
end