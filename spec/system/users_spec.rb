require 'rails_helper'

describe 'ユーザーの管理機能', type: :system do
    let!(:user_admin) { FactoryBot.create(:user, name: '管理ユーザー', email: 'admin@example.com', admin: true) }

    describe 'ログイン機能' do
        context '項目を全て入力したとき' do
            before do
                # ログインする
                visit login_path
                fill_in 'メールアドレス', with: user_admin.email
                fill_in 'パスワード', with: user_admin.password
                click_button 'ログインする'
            end
            
            it '正常にログインされる' do
                expect(page).to have_selector '.alert-success', text: 'ログインしました。'
            end 
        end
    end
end