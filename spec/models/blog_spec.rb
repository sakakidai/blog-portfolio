require 'rails_helper'

RSpec.describe Blog, type: :model do

  let(:blog) { FactoryBot.build(:blog) }

  it "ブログのファクトリーボットが存在する" do
    expect(blog).to be_valid
  end

  describe ":title" do
    describe "長さについて" do
      context "空文字または空のとき" do
        it "存在しない" do
          blog.title = " " * 6
          expect(blog).to_not be_valid
        end
      end
      context "１文字以下のとき" do
        it "存在しない" do
          blog.title = "a"
          expect(blog).to_not be_valid
        end
      end
      context "２文字以上のとき" do
        it "存在する" do
          blog.title = "a" * 2
          expect(blog).to be_valid
        end
      end
    end
  end

  describe ":body" do
    describe "長さについて" do
      context "空または空文字のとき" do
        it "存在しない" do
          blog.body = " " * 6
          expect(blog).to_not be_valid
        end
      end
      context "4文字以下のとき" do
        it "存在しない" do
          blog.body = "a" * 4
          expect(blog).to_not be_valid
        end
      end
      context "５文字以上のとき" do
        it "存在する" do
          blog.body = "a" * 5
          expect(blog).to be_valid
        end
      end
      context "500文字以下のとき" do
        it "存在する" do
          blog.body = "a" * 500
          expect(blog).to be_valid
        end
      end
      context "501文字以上のとき" do
        it "存在しない" do
          blog.body = "a" * 501
          expect(blog).to_not be_valid
        end
      end
    end

    context "ユーザーがいないとき" do
      it "存在しない" do
        invalid_blog = FactoryBot.build(:blogs_without_user)
        expect(invalid_blog).to_not be_valid
      end
    end
  end
end
