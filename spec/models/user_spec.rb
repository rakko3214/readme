require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context "新規登録がうまくいくとき" do
      it "内容に問題ない場合" do
        expect(@user).to be_valid
      end
    end
  end
  context "新規登録がうまくいかないとき" do
    it "nameが空だと登録できない" do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
    end
    it "emailが255文字以上のユーザーを許可しない" do
      @user.name = "a" * 256
      @user.valid?
      expect(@user.errors).to be_added(:name, :too_long, count: 255)
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワード確認とパスワードの入力が一致しません")
    end
    it "passwordが6文字以下であれば登録できない" do
      @user.password = "00"
      @user.password_confirmation = "00"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード確認とパスワードの入力が一致しません")
    end
    it "パスワードと確認用パスワードが間違っている場合、無効であること" do
      @user.password = "password"
      @user.password_confirmation = "pass"
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    it "パスワードが暗号化されていること" do
      expect(@user.encrypted_password).to_not eq "password"
    end
  end
end
