require "rails_helper"
RSpec.describe 'Blog', type: :system do

  let(:user) { FactoryBot.create(:user) }
  let(:blog) { FactoryBot.create(:blog, user: user) }

  describe "新規作成について" do

    before do
      FactoryBot.create(:user, name: "テストユーザー",
                               email: "test_user@example.com",
                               password: "password",
                               password_confirmation: "password"
                        )
    end

    context "承認済みユーザーのとき" do
      it "新規作成出来る" do
        visit root_path
        click_link "ログイン"
        fill_in "メールアドレス", with: "test_user@example.com"
        fill_in "パスワード", with: "password"
        click_button "ログイン"

        expect {
          click_link "記事作成"
          click_link "写真リンクの削除"
          fill_in "タイトル", with: "テスト"
          fill_in "記事の内容", with: "テスト投稿です。"
          click_button "登録する"
        }.to change(Blog, :count).by(1)

        click_link "ブログ"
        expect(page).to have_content "テスト投稿です。"
        click_link "テスト"
        expect(page).to have_content "テストユーザー"
      end
    end
  end
end