require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    subject { build(:user) }

    it { should have_secure_password }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:uuid) }
    it { should validate_uniqueness_of(:uuid) }

    context "encrypting email" do
      let(:user) { build(:user) }
      it "encrypts the email deterministically and in lowercase" do
        user.email = "Test@Example.com"
        user.save!
        expect(user.email).to eq("test@example.com")
      end
    end

    it 'validates the format of password if present and it has a correct format' do
      user = build(:user, password: "Azerty12345#", password_confirmation: "Azerty12345#")
      expect(user).to be_valid
    end

    it 'does not validates the format of password if present and it has incorrect format' do
      user = build(:user, password: "azerty", password_confirmation: "azerty")
      expect(user).to_not be_valid
    end
  end
end
