# == Schema Information
#
# Table name: forms
#
#  id         :bigint           not null, primary key
#  end_date   :datetime         not null
#  start_date :datetime         not null
#  status     :integer          default("open"), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class FormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
