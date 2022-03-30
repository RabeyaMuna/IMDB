require 'rails_helper'

RSpec.describe PostsController do
  let!(:user) { FactoryBot.create(:user) }
  let!(:post_1) { FactoryBot.create(:post, user_id: user.id) }
  let!(:post_2) { FactoryBot.create(:post, user_id: user.id) }

  describe 'GET #index' do

    it 'shows the list of latest publications' do
      expect(assigns(:latest_collection)).to eq([post_1, post_2])
    end

    it 'shows the list of newly added books' do
      expect(assigns(:recent_released)).to eq([post_1, post_2])
    end
  end
end
