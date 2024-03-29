# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Profile, type: :model do
    describe 'associations' do
        it { should belong_to(:user) }
    end
end
