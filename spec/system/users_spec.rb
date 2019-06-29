require "rails_helper"

RSpec.describe "User", type: :system do

  let(:user) { FactoryBot.build(:user) }

  describe "サインアップについて" do
    context "サインアップ画面で有効な値を入力するとき" do
      it "サインアップできる" do
        visit root_path
        expect {
          click_link "サインアップ"
          fill_in "名前", with: "sample"
          fill_in "メールアドレス", with: "sample@example.com"
          fill_in "パスワード", with: "password"
          fill_in "確認用パスワード", with: "password"
          click_button "アカウント登録"
        }.to change(User, :count).by(1)

        expect(page).to have_content "アカウント登録が完了しました。"
        expect(page).to have_content "sample@example.com"
        expect(page).to have_content "ログアウト"
        expect(page).to have_content "記事作成"
        expect(page).to have_content "トップページ"
      end
    end

    context "サインアップ画面で無効な値を入力したとき" do
      it "エラーがでる" do
        visit root_path
        expect {
          click_link "サインアップ"
          fill_in "名前", with: ""
          fill_in "メールアドレス", with: ""
          fill_in "パスワード", with: ""
          fill_in "確認用パスワード", with: ""
          click_button "アカウント登録"
        }.to change(User, :count).by(0)

        expect(page).to have_content "4 件のエラーが発生したため ユーザー は保存されませんでした。"
      end
    end
  end

  describe "ログインについて" do

    before do
      FactoryBot.create(:user, name: "テストユーザー",
                               email: "test_user@example.com",
                               password: "password",
                               password_confirmation: "password"
                        )
    end

    context "ログイン画面で有効な値を入力するとき" do
      it "ログインできる" do
        visit root_path
        click_link "ログイン"
        fill_in "メールアドレス", with: "test_user@example.com"
        fill_in "パスワード", with: "password"
        click_button "ログイン"

        expect(page).to have_content "ログインしました。"
        expect(page).to have_content "test_user@example.com"
        expect(page).to have_content "ログアウト"
        expect(page).to have_content "記事作成"
        expect(page).to have_content "トップページ"
      end
    end

    context "ログイン画面で無効な値を入力するとき" do
      it "ログインできない" do
        visit root_path
        click_link "ログイン"
        fill_in "メールアドレス", with: "test_user@example.com"
        fill_in "パスワード", with: "password1"
        click_button "ログイン"

        expect(page).to have_content "メールアドレスまたはパスワードが違います。"
      end
    end
  end

  describe "ログアウトについて" do

    before do
      FactoryBot.create(:user, name: "テストユーザー",
                               email: "test_user@example.com",
                               password: "password",
                               password_confirmation: "password"
                        )
    end

    it "ログインしてログアウトする" do
      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: "test_user@example.com"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
      click_link "ログアウト"

      expect(page).to have_content "ログアウトしました。"
    end
  end


end