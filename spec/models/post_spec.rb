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
    it { is_expected.to have_many(:post_ratings) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:post_reports)}
    it { is_expected.to have_one(:poster_attachment) }
    it { is_expected.to have_one(:trailer_attachment) }
    it { is_expected.to have_many(:images_attachments) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:release_date) }
    it { is_expected.to validate_size_of(:poster).less_than_or_equal_to(5.megabytes) }
    it { is_expected.to validate_content_type_of(:poster).allowing('image/jpg', 'image/jpeg', 'image/png').rejecting([]) }
    it { is_expected.to validate_size_of(:trailer).less_than_or_equal_to(500.megabytes) }
    it do
      is_expected.to validate_content_type_of(:trailer).allowing(%w(mp4 mov mkv h264 h265
                                                                   webm)).rejecting([])
    end
  end


end
