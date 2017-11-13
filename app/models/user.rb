class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  after_create :update_access_token!

  validates_uniqueness_of :username
  validates_presence_of :username

  validates :username, presence: true
  validates :password, presence: true

  validates_length_of :twitter, :minimum => 1, :maximum => 20, :allow_blank => true
  validates_length_of :language, :minimum => 1, :maximum => 20, :allow_blank => true

  alias_attribute :created_missions, :missions

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end

  def complete(mission)
    !self.completed_missions.include?(mission) and self.completed_missions << mission
  end

  def uncomplete(mission)
    self.completed_missions.include?(mission) and self.completed_missions.destroy mission
  end

  # devise module deactivate email
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
