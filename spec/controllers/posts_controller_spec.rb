require 'rails_helper'

RSpec.describe PostsController do
  let!(:user) { FactoryBot.create(:user) }
  let!(:post_1) { FactoryBot.create(:post, user_id: user.id, score: 4) }
  let!(:post_2) { FactoryBot.create(:post, user_id: user.id) }

  before(:each) do
    sign_in user
  end

  describe 'GET #index' do
    context 'with valid attibutes' do
      before { get :index }

      it { is_expected.to render_template(:index) }
      it { is_expected.to respond_with(:success) }

      it 'assigns all posts into post' do
        expect(assigns(:posts)).to match_array([post_1, post_2])
      end
    end
  end

  describe 'GET #show' do
    context 'with valid attributes' do
      before { get :show, params: { id: post_1.id } }

      it { is_expected.to render_template(:show) }
      it { is_expected.to respond_with(:success) }

      it 'assigns the post to @post' do
        expect(assigns(:post)).to eq post_1
      end
    end
  end

  describe 'GET #new' do
    before { get :new }

    it { is_expected.to render_template(:new) }
    it { is_expected.to respond_with(:success) }

    it 'assigns a new post to @post' do
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:post_params) { FactoryBot.attributes_for(:post) }
      let(:create_action) { post :create, params: { post: post_params } }

      it 'redirects to index' do
        expect(create_action).to redirect_to(root_path)
      end

      it 'creates a new post into database' do
        expect { create_action }.to change(Post, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      let(:post_params) { FactoryBot.attributes_for(:post, name: '') }
      let(:create_action) { post :create, params: { post: post_params } }

      it 'renders new template' do
        expect(create_action).to render_template(:new)
      end

      it 'does not create a post to the database' do
        expect { create_action }.to_not change(Post, :count)
      end
    end
  end

  describe 'GET #edit' do
    context 'with valid attibutes' do
      before { get :edit, params: { id: post_1.id } }

      it { is_expected.to render_template(:edit) }
      it { is_expected.to respond_with(:success) }

      it 'assigns post to @post' do
        expect(assigns(:post)).to eq post_1
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      let(:new_params) { FactoryBot.attributes_for(:post, name: 'Some post') }

      before { patch :update, params: { id: post_1.id, post: new_params } }

      it { is_expected.to redirect_to(posts_path) }

      it 'updates the name of the post' do
        post_1.reload

        expect(post_1.name).to eq('Some post')
      end
    end

    context 'with invalid attributes' do
      let(:new_params) { FactoryBot.attributes_for(:post, name: '') }

      before { patch :update, params: { id: post_1.id, post: new_params } }

      it { is_expected.to render_template(:edit) }
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid attributes' do
      let(:delete_action) { delete :destroy, params: { id: post_1.id } }

      it 'deletes a post from the database' do
        expect { delete_action }.to change(Post, :count).by(-1)
      end

      it 'redirects to index' do
        expect(delete_action).to redirect_to(posts_path)
      end
    end
  end
end
