class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @horse = Horse.find(params[:horse_id])
    current_user.favorites.create(horse: @horse)
    
    # Turbo Streamでボタン部分だけ書き換え
    render turbo_stream: turbo_stream.replace("favorite_button_#{@horse.id}", partial: 'horses/favorite_button', locals: { horse: @horse })
  end

  def destroy
    @horse = Horse.find(params[:horse_id])
    favorite = current_user.favorites.find_by(horse: @horse)
    favorite.destroy

    # Turbo Streamでボタン部分だけ書き換え
    render turbo_stream: turbo_stream.replace("favorite_button_#{@horse.id}", partial: 'horses/favorite_button', locals: { horse: @horse })
  end
end