require 'rails_helper'

RSpec.describe Goal, type: :model do

  describe "Validations and Associations" do

    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:private) }
    it { should validate_presence_of(:completed) }
    it { should belong_to(:user) }

  end
end
