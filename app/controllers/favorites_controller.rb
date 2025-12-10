class FavoritesController < ApplicationController
  # ログインしているユーザーのみ実行可能にする（Devise使用時）
  # before_action :authenticate_user! 

  def create
    horse = Horse.find(params[:horse_id])
    current_user.favorites.create(horse: horse)
    redirect_back(fallback_location: root_path, notice: "#{horse.name}を推し馬に登録しました！")
  end

  def destroy
    horse = Horse.find(params[:horse_id])
    favorite = current_user.favorites.find_by(horse_id: horse.id)
    favorite.destroy
    redirect_back(fallback_location: root_path, alert: "#{horse.name}の登録を解除しました。")
  end
end