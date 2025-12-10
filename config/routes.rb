Rails.application.routes.draw do
  root 'horses#index' # トップページを馬の検索/一覧に

  resources :horses, only: [:index, :show] do
    resource :favorites, only: [:create, :destroy] # お気に入り登録/解除
    resources :comments, only: [:create, :destroy] # 感想投稿
  end
  
  # ユーザーマイページ（お気に入り一覧用）
  resources :users, only: [:show]
end