class HorsesController < ApplicationController
  before_action :set_horse, only: %i[ show edit update destroy ]

  def index
    @search_term = params[:search]

    if @search_term.present?
      # 部分一致で検索
      @horses = Horse.where("name LIKE ?", "%#{@search_term}%")
    else
      # 検索なしの時は最近更新された順に表示（Wikiっぽい挙動）
      @horses = Horse.order(updated_at: :desc).limit(10)
    end

    # 新規作成用（検索ワードを初期値にする）
    @new_horse = Horse.new(name: @search_term)
  end

  def show
  end

  # Wikiなので誰でも編集画面に行けるように
  def edit
  end

  def create
    @horse = Horse.new(horse_params)
    if @horse.save
      redirect_to horse_path(@horse), notice: "新しいページ「#{@horse.name}」が作成されました！"
    else
      redirect_to horses_path(search: @horse.name), alert: "作成に失敗しました。"
    end
  end

  def update
    if @horse.update(horse_params)
      redirect_to horse_path(@horse), notice: "情報を更新しました（更新完了）"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @horse.destroy
    redirect_to horses_path, notice: "ページを削除しました。"
  end

  private
    def set_horse
      @horse = Horse.find(params[:id])
    end

    def horse_params
      # Wiki本文として description を許可
      params.require(:horse).permit(:name, :description)
    end
    
    def horse_params
      # ▼ ここに :race_schedule を追加しました
      params.require(:horse).permit(:name, :description, :race_schedule)
    end
end