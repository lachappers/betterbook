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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :posts
  has_many :comments
  has_many :likes
  has_one :profile, dependent: :destroy
  # has_one_attached :profile_image
  # has_many :notifications, dependent: :destroy
  has_many :friendships_as_sender, class_name: :Friendship, foreign_key: :sender_id, dependent: :destroy
  has_many :friendships_as_recipient, class_name: :Friendship, foreign_key: :recipient_id, dependent: :destroy
  has_many :friends, -> { merge(Friendship.friends) }, through: :friendships_as_sender, source: :recipient
  has_many :sent_requests, -> { merge(Friendship.pending) }, through: :friendships_as_sender, source: :recipient
  has_many :received_requests, -> { merge(Friendship.pending) }, through: :friendships_as_recipient, source: :sender


  accepts_nested_attributes_for :profile, allow_destroy: true
end
