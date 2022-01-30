# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  max_char   :integer
#  max_value  :integer
#  min_value  :integer
#  options    :string           default([]), is an Array
#  required   :boolean
#  title      :string           not null
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :bigint           not null
#
# Indexes
#
#  index_questions_on_section_id  (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id)
#
class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :type, :required, :max_char, :max_value, :min_value, :options, :responses
  
  def responses
    object.responses&.map { |response| ResponseSerializer.new(response) }
  end
end
