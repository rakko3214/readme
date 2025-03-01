require 'rails_helper'

RSpec.describe Menu, type: :model do
  before do
    @menu = FactoryBot.build(:menu)
  end
  describe "レシピ登録" do
    context "新規登録がうまくいくとき" do
      it "内容に問題ない場合" do
        expect(@menu).to be_valid
      end
    end
  end
  context "新規登録がうまくいかないとき" do
    it "titleが空だと登録できない" do
      @menu.title = ""
      @menu.valid?
      expect(@menu.errors.full_messages).to include("献立名を入力してください")
    end
    it "titleが255文字以上のユーザーを許可しない" do
      @menu.title = "a" * 256
      @menu.valid?
      expect(@menu.errors).to be_added(:title, :too_long, count: 255)
    end
  end
end
