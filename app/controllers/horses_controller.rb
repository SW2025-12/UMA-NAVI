def index
  # Ransackを使った検索機能
  @q = Horse.ransack(params[:q])
  @horses = @q.result(distinct: true).includes(:race_results).with_attached_image
end