class HorsesController < ApplicationController
  def index
    # メイン：検索機能
    if params[:search].present?
      @horses = Horse.search_by_name(params[:search])
      @search_mode = true # 検索結果表示モード
    else
      @search_mode = false
      
      # 1. 開催予定のレース（直近の未来のもの）
      @upcoming_races = Race.where("date >= ?", Date.today).order(:date).limit(6)
      
      # 2. 人気ランキング（お気に入り登録数が多い順）
      # ※ favoritesテーブルがないとエラーになるので、なければ .limit(3) だけでもOK
      @ranking_horses = Horse.left_joins(:favorites)
                             .group(:id)
                             .order('COUNT(favorites.id) DESC')
                             .limit(3)

      # 3. 今日のピックアップ（ランダムに1頭紹介）
      @pickup_horse = Horse.order("RANDOM()").first
    end
  end
  
  # ... showメソッドなどはそのまま ...
end