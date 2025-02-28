require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @recipe = FactoryBot.build(:recipe)
  end
  describe "レシピ登録" do
    context "新規登録がうまくいくとき" do
      it "内容に問題ない場合" do
        expect(@recipe).to be_valid
      end
    end
  end
  context "新規登録がうまくいかないとき" do
    it "titleが空だと登録できない" do
      @recipe.title = ""
      @recipe.valid?
      expect(@recipe.errors.full_messages).to include("レシピ名を入力してください")
    end
    it "titleが255文字以上のユーザーを許可しない" do
      @recipe.title = "a" * 256
      @recipe.valid?
      expect(@recipe.errors).to be_added(:title, :too_long, count: 255)
    end
    it "contentが空だと登録できない" do
      @recipe.content = ""
      @recipe.valid?
      expect(@recipe.errors.full_messages).to include("手順を入力してください")
    end
    it "contentが255文字以上のユーザーを許可しない" do
      @recipe.content = "a" * 256
      @recipe.valid?
      expect(@recipe.errors).to be_added(:content, :too_long, count: 255)
    end
    it "cooking_timeが空だと登録できない" do
      @recipe.cooking_time = ""
      @recipe.valid?
      expect(@recipe.errors.full_messages).to include("調理時間を入力してください")
    end
  end
end
