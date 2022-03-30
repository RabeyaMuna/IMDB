require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryBot.create(:user) }

  it 'has a valid user factory' do
    expect(user).to be_valid
  end

  describe 'associations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:post_ratings) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:post_reports).through(:posts) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_content_type_of(:avatar).allowing('image/jpg', 'image/jpeg', 'image/png').rejecting([]) }
  end

  describe 'password validations' do
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    it { is_expected.to allow_value('something').for(:password) }
    it { is_expected.not_to allow_value('some').for(:password) }
  end
end
