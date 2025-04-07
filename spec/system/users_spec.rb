require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  describe "ログイン前" do
    describe "ユーザー新規登録" do
      context "フォームの入力値が正常" do
        it "ユーザーの新規作成が成功する" do
          visit new_user_registration_path
          fill_in "ニックネーム", with: "name"
          fill_in "メールアドレス", with: "tess@example.com"
          fill_in "パスワード", with: "password"
          fill_in "パスワード確認", with: "password"
          click_on "登録"
        end
      end

      context "メールアドレスが未入力" do
        it "ユーザーの新規作成が失敗する" do
          visit new_user_registration_path
          fill_in "ニックネーム", with: "name"
          fill_in "メールアドレス", with: ""
          fill_in "パスワード", with: "password"
          fill_in "パスワード確認", with: "password"
          click_on "登録"
          expect(page).to have_content "メールアドレスを入力してください"
          expect(current_path).to eq new_user_registration_path
        end
      end
    end
  end

  describe "マイページ" do
    context "ログインしていない状態" do
      it "マイページへのリンクでなくログインリンクが表示されている" do
        visit root_path
        expect(page).to have_content("ログイン")
      end
    end
  end
end
