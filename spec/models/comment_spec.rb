require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:comment) { FactoryBot.build(:comment) }

    it 'is a valid post_rating)' do
      expect(comment).to be_valid
    end

  describe 'associations' do
    it { is_expected.to have_many(:reports)}
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:comment) }
  end
end
