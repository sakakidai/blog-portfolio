require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { FactoryBot.create(:user) }

  describe "#index" do
    it "正常にレスポンスを返すこと" do
      get :index
      expect(response).to be_successful
    end
    it "200レスポンスを返すこと" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "#show" do
    it "正常にレスポンスを返すこと" do
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end
    it "200レスポンスを返すこと" do
      get :show, params: { id: user.id }
      expect(response).to have_http_status "200"
    end
  end

  describe "#follows" do
    it "正常にレスポンスを返すこと" do
      get :follows, params: { id: user.id }
      expect(response).to be_successful
    end
    it "200レスポンスを返すこと" do
      get :follows, params: { id: user.id }
      expect(response).to have_http_status "200"
    end
  end

  describe "#followers" do
    it "正常にレスポンスを返すこと" do
      get :followers, params: { id: user.id }
      expect(response).to be_successful
    end
    it "200レスポンスを返すこと" do
      get :followers, params: { id: user.id }
      expect(response).to have_http_status "200"
    end
  end
end
