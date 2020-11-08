class UsersController < ApplicationController

  def index
    @userall = User.all
    @user = User.find(current_user.id)
    @book = Book.new()
  end

 
  def show
    #①
    @user = User.find(params[:id])
    @book = Book.new()
    #@post_images = @user.post_images.page(params[:page]).reverse_order
    #ログインしている人のuserルーム
    @currentUserUserRoom=UserRoom.where(user_id: current_user.id)
    #①のユーザーのuserルーム
    @userUserRoom=UserRoom.where(user_id: @user.id)
    #もしも①とログインしているuserが一致しなければ
    unless @user.id == current_user.id
      @currentUserUserRoom.each do |cu|
        @userUserRoom.each do |u|
          #もし、ログインしているuserルームと①のユーザーのルームが一致しているのならば
          if cu.room_id == u.room_id then
            #②...そのルームは自分のルーム
            @isRoom = true
            #ログインしているuserのルームid
            @roomId = cu.room_id
          end
        end
      end
      #もし、②があれば
      if @isRoom
      else
        #新しいルームを作成する。
        @room = Room.new
        @UserRoom = UserRoom.new
      end
    end
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
    params.require(:user).permit(:name, :introduction, :profile_image, :postcode, :prefecture_name, :address_city, :address_street, :address_building)
  end

end
