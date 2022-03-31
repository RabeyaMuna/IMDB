require 'rails_helper'

RSpec.describe PostRating, type: :model do
    let(:user) { FactoryBot.create(:user) }
    let(:post_rating) { FactoryBot.build(:post_rating) }

    it 'is a valid post_rating)' do
      expect(post_rating).to be_valid
    end

  describe 'associations' do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:rating) }
    it { is_expected.to validate_inclusion_of(:rating).in_range(0..5) }
  end
end
