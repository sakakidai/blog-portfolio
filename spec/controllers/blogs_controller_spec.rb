require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:blog) { FactoryBot.create(:blog, user: user) }
  let(:other_user) { FactoryBot.create(:other_user) }

  describe "#index" do
    it "正常にレスポンスを返す" do
      get :index
      expect(response).to be_successful
    end
    it "200レスポンスを返す" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "#show" do
    it "正常にレスポンスを返す" do
      get :show, params: { id: blog.id }
      expect(response).to be_successful
    end
    it "200レスポンスを返す" do
      get :show, params: { id: blog.id }
      expect(response).to have_http_status "200"
    end
  end

  describe "#new" do
    describe "ログインユーザーのとき" do
      it "正常にレスポンスを返す" do
        sign_in(blog.user)
        get :new
        expect(response).to be_successful
      end
      it "200レスポンスを返す" do
        sign_in(blog.user)
        get :new
        expect(response).to have_http_status "200"
      end
    end

    describe "ログインしてないとき" do
      it "302レスポンスを返す" do
        get :new
        expect(response).to have_http_status "302"
      end

      it "ログイン画面にリダイレクトする" do
        get :new
        expect(response).to redirect_to "/login"
      end
    end
  end

  describe "#edit" do
    context "ログインユーザーのとき" do
      it "正常にレスポンスを返す" do
        sign_in(blog.user)
        get :edit, params: { id: blog.id }
        expect(response).to be_successful
      end
      it "200レスポンスを返す" do
        sign_in(blog.user)
        get :edit, params: { id: blog.id }
        expect(response).to have_http_status "200"
      end
    end

    context "ログインしてないとき" do
      it "302レスポンスを返す" do
        get :edit, params: { id: blog.id }
        expect(response).to have_http_status "302"
      end

      it "ログイン画面にリダイレクトする" do
        get :edit, params: { id: blog.id }
        expect(response).to redirect_to "/login"
      end
    end

    context "ユーザーが作成したユーザーと異なるとき" do
      it "302レスポンスを返す" do
        sign_in(other_user)
        get :edit, params: { id: blog.id }
        expect(response).to have_http_status "302"
      end

      it "ルートページにリダイレクトする" do
        sign_in(other_user)
        get :edit, params: { id: blog.id }
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#create" do
    context "ログインしているとき" do
      it "ブログを追加できる" do
        sign_in(other_user)
        expect { 
          post :create, params: { blog: { title: "テスト２", body: "テスト２のボディーです" } }
        }.to change(Blog, :count).by(1)
      end
    end

    context "ログインしていないとき" do
      it "ブログを追加できない" do
        expect { 
          post :create, params: { blog: { title: "テスト２", body: "テスト２のボディーです" } }
        }.to change(Blog, :count).by(0)
      end

      it "302レスポンスを返す" do
        post :create
        expect(response).to have_http_status "302"
      end

      it "ログイン画面にリダイレクトする" do
        post :create
        expect(response).to redirect_to "/login"
      end
    end
  end
end
