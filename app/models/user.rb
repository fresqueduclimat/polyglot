class User < ApplicationRecord
  has_secure_password
  encrypts :email, deterministic: true, downcase: true

  validates :email, :uuid, presence: true, uniqueness: true

  # (?=.{12,}) : at least 12 chars
  # (?=.*\d) : at least 1 number
  # (?=.*[a-z]) : at least 1 downcase letter
  # (?=.*[A-Z]) : at least 1 uppercase letter
  # (?=.*[@:,\-?*_()!#$%^&+=]) : at least 1 of these special chars
  validates :password, format: Constants::Regex::PASSWORD, if: proc { |u| u.password.present? }

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end
end
