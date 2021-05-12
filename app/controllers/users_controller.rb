class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:id]).reverse_order #ユーザ（@user）に関連付けられた投稿（.post_images）のみ取得
  end
  
  def edit
    @user = User.find(params[:id])
  end
end
