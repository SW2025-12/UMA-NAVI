Rails.application.routes.draw do
  # トップページを馬の一覧ページに設定
  root 'horses#index'

  # ▼ ここを変更しました（only: [] を消して、登録・編集・削除など全ての機能を使えるようにします）
  resources :horses do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show]
end