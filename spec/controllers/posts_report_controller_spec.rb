require 'rails_helper'

RSpec.describe PostReportsController do
  let(:user) { FactoryBot.create(:user) }
  let(:user_1) { FactoryBot.create(:user) }
  let!(:post) { FactoryBot.create(:post, user_id: user.id, score: 4) }
  let(:post_report) { FactoryBot.create(:post_report, post_id: post.id, user_id: user_1.id) }
  let!(:post_report_1) { FactoryBot.create(:post_report, post_id: post.id, user_id: user.id) }

  before(:each) do
    sign_in user
  end

  describe 'GET #index' do
    context 'with valid attibutes' do
      before { get :index, params: { post_id: post.id } }

      it { is_expected.to render_template(:index) }
      it { is_expected.to respond_with(:success) }

      it 'assigns all posts report under a post post' do
        expect(assigns(:post_reports)).to match_array([post_report, post_report_1])
      end
    end
  end

  
  describe 'DELETE #destroy' do
    context 'with valid attributes' do
      let(:delete_action) { delete :destroy, params: { post_id: post.id, id: post_report_1.id } }

      it 'deletes a post from the database' do
        expect { delete_action }.to change(PostReport, :count).by(-1)
      end

      it 'redirects to index' do
        expect(delete_action).to redirect_to(post_post_reports_path)
      end
    end
  end
end
