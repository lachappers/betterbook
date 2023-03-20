# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
    require 'open-uri'
    factory :user do
       email { Faker::Internet.unique.email }
       password {"password"}
       password_confirmation {"password"}

       factory :user_with_profile do
            after(:create) do |user|
                create(:profile, user: user)
                file = URI.open('https://doodleipsum.com/700/avatar-5?bg=3D27F6i=f339578a64040310d3eb5bd82b550627')
                user.profile_image.attach(io: file, filename: 'profile.png', content_type: 'image/png')
            end
       end
    end
end