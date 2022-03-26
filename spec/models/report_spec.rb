require 'rails_helper'

RSpec.describe Report, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:comment) { FactoryBot.create(:comment) }

    it 'is a valid comment' do
      expect(comment).to be_valid
    end

  describe 'associations' do
    it { is_expected.to belong_to(:comment) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
  end
end
