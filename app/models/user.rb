class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :bars, dependent: :destroy
  has_one :profile, dependent: :destroy

  has_many :sent_chatboxes, :class_name => 'Chatbox', :foreign_key => 'sender_id', dependent: :destroy
  has_many :received_chatboxes, :class_name => 'Chatbox', :foreign_key => 'recipient_id', dependent: :destroy
  has_many :messages, dependent: :destroy

  after_create :create_profile

  private

  def create_profile
    if self.profile.nil?
      blank_profile = Profile.new(username: self[:email], address: "blank")
      blank_profile.user = self
      blank_profile.save
    end
  end
end
