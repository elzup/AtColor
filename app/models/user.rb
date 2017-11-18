class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  after_create :update_access_token!

  validates_uniqueness_of :username
  validates_presence_of :username

  validates :username, presence: true, on: :create
  validates :password, presence: true, on: :create

  validates_length_of :twitter, :minimum => 1, :maximum => 20, :allow_blank => true
  validates_length_of :language, :minimum => 1, :maximum => 20, :allow_blank => true

  has_many :solvings
  has_many :questions, :through => :solvings
  alias solved_questions questions

  def last_solved_at
    if solvings.count == 0
      return created_at
    end
    solvings.last.created_at
  end

  def total_point
    solved_questions.sum(:point)
  end

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
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

  def solved(qid)
    solve = solvings.find_or_initialize_by(question_id: Question.find_by_qid(qid).id)
    if solve.new_record?
      solve.save
      return true
    end
    false
  end
end
