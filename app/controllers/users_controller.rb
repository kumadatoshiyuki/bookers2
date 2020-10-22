class UsersController < ApplicationController

  def index
    @userall = User.all
    @user = User.find(current_user.id)
    @book = Book.new()
  end


  def show
    @user = User.find(params[:id])
    @book = Book.new()
    #@post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
     if @user != current_user
       redirect_to user_path(current_user)
     end

  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
    else
      render ("users/edit")
    end
  end

   private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
