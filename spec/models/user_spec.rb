require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  it "ファクトリーボットが存在する" do
    expect(user).to be_valid
  end

  describe ":name" do
    describe "名前の長さについて" do
      context "空か空文字のとき" do
        it "存在しない" do
          user.name = " "
          expect(user).to_not be_valid
        end
      end
      context "1文字のとき" do
        it "存在しない" do
          user.name = "a" * 1
          expect(user).to_not be_valid
        end
      end
      context "2文字のとき" do
        it "存在する" do
          user.name = "a" * 2
          expect(user).to be_valid
        end
      end
      context "20文字のとき" do
        it "存在する" do
          user.name = "a" * 20
          expect(user).to be_valid
        end
      end
      context "21文字以上のとき" do
        it "存在しない" do
          user.name = "a" * 21
          expect(user).to_not be_valid
        end
      end
    end
  end

  describe ":email" do
    describe "長さについて" do
      context "空か空文字のとき" do
        it "存在しない" do
          user.email = " "
          expect(user).to_not be_valid
        end
      end
      context "255文字以上のとき" do
        it "存在する" do
          user.email = "a" * 243 + "@example.com"
          expect(user).to be_valid
        end
      end
      context "256文字以上のとき" do
        it "存在しない" do
          user.email = "a" * 244 + "@example.com"
          expect(user).to_not be_valid
        end
      end
    end

    describe "フォーマットについて" do
      context "フォーマットが有効なとき" do
        it "存在する" do
          addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
          addresses.each do |valid_address|
            user.email = valid_address
            expect(user).to be_valid
          end
        end
      end
      context "フォーマットが無効なとき" do
        it "存在しない" do
          addresses = %w[user@example,com user_at_foo.org user.name@example. 
                      foo@bar_baz.com foo@bar+baz.com]
          addresses.each do |invalid_address|
            user.email = invalid_address
            expect(user).to_not be_valid
          end
        end
      end
      context "メールアドレスがすでに存在するとき" do
        it "存在しない" do
          user = FactoryBot.create(:user, email: "example@example.com")
          other_user = FactoryBot.build(:user, email: "example@example.com")
          expect(other_user).to_not be_valid
        end
      end
      context "メールアドレスを保存時するとき" do
        it "小文字に変換する" do
          user.email = "Foo@ExAMPle.CoM"
          user.save
          expect(user.reload.email).to eq "foo@example.com"
        end
      end
    end
  end

  describe ":password" do
    describe "パスワードの長さについて" do
      context "空または空文字のとき" do
        it "存在しない" do
          user.password = user.password_confirmation = " " * 6
          expect(user).to_not be_valid
        end
      end
      context "5文字のとき" do
        it "存在しない" do
        user.password = user.password_confirmation = "a" * 5
        expect(user).to_not be_valid
        end
      end
      context "6文字のとき" do
        it "存在する" do
        user.password = user.password_confirmation = "a" * 6
        expect(user).to be_valid
        end
      end
    end
  end
end
