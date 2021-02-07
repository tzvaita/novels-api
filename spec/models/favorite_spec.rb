require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it { should validate_presence_of(:liker_id)}

  it { should validate_presence_of(:liked_id) }

  it { should belong_to(:liker) }

  it { should belong_to(:liked) }
end
