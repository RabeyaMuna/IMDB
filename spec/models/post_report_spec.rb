require 'rails_helper'

RSpec.describe PostReport, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }
  let(:post_report) { FactoryBot.build(:post_report) }

    it 'is a valid post report)' do
      expect(post_report).to be_valid
    end

  describe 'associations' do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:message) }
  end
end
