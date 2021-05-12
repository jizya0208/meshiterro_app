class PostCommentsController < ApplicationController
  
  def create
    post_image = PostImage.find(params[:post_image_id]) #フォームから受け取ったインスタンス変数@post_imageにより投稿を特定する
    comment = current_user.post_comments.new(post_comment_params)  #PostCommentモデルを基にオブジェクトを生成。user_idはcurrent_user。newの引数でフォームの入力値(commentの内容)を受け取る。
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image) 
  end

  def destroy
    PostComment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy #params[:id]でPostCommentのidを特定, params[post_image_id]で投稿idを特定し、結びつける。
    redirect_to post_image_path(params[:post_image_id])
  end
  
  private 
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
