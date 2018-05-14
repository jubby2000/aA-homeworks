require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new(email: "email", password: "password")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
end
