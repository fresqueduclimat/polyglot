FactoryBot.define do
  factory :user do
    uuid { SecureRandom.uuid }
    email { "user@example.com" }
    password { "Azerty12345#" }
    password_confirmation { "Azerty12345#" }
  end
end
