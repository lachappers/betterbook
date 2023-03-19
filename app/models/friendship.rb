# == Schema Information
#
# Table name: friendships
#
#  id           :bigint           not null, primary key
#  confirmed    :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :bigint           not null
#  sender_id    :bigint           not null
#
# Indexes
#
#  index_friendships_on_recipient_id  (recipient_id)
#  index_friendships_on_sender_id     (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipient_id => users.id)
#  fk_rails_...  (sender_id => users.id)
#
class Friendship < ApplicationRecord
    belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
    belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'

    scope :friends, -> { where('confirmed =?', true) }
    scope :pending, -> { where('confirmed =?', false) }
end
