class PostImagesController < ApplicationController
  
  def new
    @post_image = PostImage.new
  end
  
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id     #投稿(post_image)と投稿者(User)を結びつける。current_userは現在ログインしているユーザーを表すメソッド。
    @post_image.save
    redirect_to post_images_path
  end
  
  def index
  end
  
  def show
  end
  
  def destroy
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
