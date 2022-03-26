require 'rails_helper'

RSpec.describe CastCrew, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }
  let(:cast_crew) { FactoryBot.build(:cast_crew) }

    it 'is a valid cast crew)' do
      expect(cast_crew).to be_valid
    end

  describe 'associations' do
    it { is_expected.to belong_to(:post) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cast_type) }
  end
end
