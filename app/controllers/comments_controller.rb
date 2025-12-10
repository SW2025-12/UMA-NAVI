class CommentsController < ApplicationController
  # ログインしていないとコメントできないようにする（Devise使用時）
  # before_action :authenticate_user!

  def create
    horse = Horse.find(params[:horse_id])
    
    # コメントを作成
    comment = horse.comments.build(comment_params)
    comment.user_id = current_user.id # ログイン中のユーザーIDをセット

    if comment.save
      # 成功したら、元のページに戻る（検索画面なら検索画面へ）
      redirect_back(fallback_location: horse_path(horse), notice: 'コメントを投稿しました！')
    else
      redirect_back(fallback_location: horse_path(horse), alert: 'コメントの投稿に失敗しました。')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end