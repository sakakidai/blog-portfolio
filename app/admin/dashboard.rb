ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    h2 class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span("ようこそ！！Blog Portfolioの管理画面へ！！")
        small("ナビゲーションバーからそれぞれのモデルにアクセス出来ます。")
        small("ユーザー、ブログ、カテゴリーの作成、削除、編集が出来ます。")
      end
    end
  end
end
