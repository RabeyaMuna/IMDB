require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validation a post' do
    let(:user) { FactoryBot.create(:user)}
    let(:post) { FactoryBot.create(:post, user_id: user.id ) }
    it 'has a valid factory' do
      expect(post).to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:post_ratings).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:post_reports).dependent(:destroy) }
    it { is_expected.to have_many(:videos_attachments) }
    it { is_expected.to have_many(:images_attachments) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:release_date) }
    it { is_expected.to validate_size_of(:images).less_than_or_equal_to(5.megabytes) }
    it { is_expected.to validate_content_type_of(:images).allowing('image/jpg', 'image/jpeg', 'image/png').rejecting([]) }
    it { is_expected.to validate_size_of(:videos).less_than_or_equal_to(500.megabytes) }
    it do
      is_expected.to validate_content_type_of(:videos).allowing(%w(mp4 mov mkv h264 h265
                                                                   webm)).rejecting([])
    end
  end


end
