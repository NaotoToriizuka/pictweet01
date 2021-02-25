require 'rails_helper'

RSpec.describe "ツイート投稿" type: :system do
  before do
    @user = FactoryBot.create(:user)
    @tweet_text = Faker::Lorem.sentence
    @tweet_image = Faker::Lorem.sentence
  end

  context 'ツイートが投稿できるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      #ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      #新規投稿ページのリンクがある
      expect(page).to have_content "新規投稿"
      #投稿ページに移動する
      find().to click
      #フォームに情報を入力する
      #送信するとTweetモデルのカウントが1上がる
      #投稿完了ページに遷移する
      #「投稿が完了しました」の文字がある
      #トップページに遷移する
      #トップページには先ほど投稿した内容のツイートが存在する（画像）
      #トップページには先ほど投稿した内容のツイートが存在する（テキスト）

    end
  end
  context 'ツイートが投稿できないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      #トップページに遷移する
      #新規投稿ページのリンクがない
    end
  end
end