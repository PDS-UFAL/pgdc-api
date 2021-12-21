# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  role            :integer          default("employee"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  sector_id       :bigint
#
# Indexes
#
#  index_users_on_sector_id  (sector_id)
#
# Foreign Keys
#
#  fk_rails_...  (sector_id => sectors.id)
#
FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 6) }
    role { "employee" }

    trait :admin do
      role { "admin" }
    end

    trait :with_sector do
      sector_id { 1 }
    end
  end
end
