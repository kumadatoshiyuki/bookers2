class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create
    @UserRoom1 = UserRoom.create(room_id: @room.id, user_id: current_user.id)
    @UserRoom2 = UserRoom.create(params.require(:user_room).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    # ①パラムスIDからRoomデータを取得する。
    @room = Room.find(params[:id])
    # もしも
    # ユーザールームの
    # user_idのカラムより、ログインしているユーザのIDと、
    # room_idのカラムより、①のIDから
    # 検索し値を取得する。
    # 存在すれば
    if UserRoom.where(user_id: current_user.id,room_id: @room.id).present?
      # 存在した場合
      # @chatsの中に①のチャット
      @chats = @room.chats
      # @chatは新しい空のお弁当箱
      @chat = Chat.new
      # @user_roomsの中に①とユーザールームが入っている。
      @user_rooms = @room.user_rooms
    else
      # 存在しない場合
      redirect_back(fallback_location: root_path)
    end
  end
end
