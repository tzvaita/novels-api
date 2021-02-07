require 'rails_helper'

RSpec.describe User, type: :model do
  # ensure there is an email for account creation
  it { should validate_presence_of(:email) }

  # ensure there is a password
  it {should validate_presence_of(:password) }
end
