class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :not_duplicate_response
  validate :own_poll

  belongs_to :respondent, class_name: :User,
            primary_key: :id, foreign_key: :user_id

  belongs_to :answer_choice, class_name: :AnswerChoice,
            primary_key: :id, foreign_key: :answer_choice_id

  has_one :question, through: :answer_choice, source: :question

  def sibling_responses
    #all responses with the same questions id
    question.responses.where.not(id: id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def not_duplicate_response
    if respondent_already_answered?
      errors[:base] << "already answered"
    end
  end

  def own_poll
    if question.poll.author_id == self.user_id
      errors[:you] << "made it"
    end
  end
end
