# == Schema Information
#
# Table name: responses
#
#  id          :bigint           not null, primary key
#  answer      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_responses_on_question_id  (question_id)
#  index_responses_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (user_id => users.id)
#
class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :answer
  has_one :user
end
