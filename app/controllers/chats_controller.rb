class ChatsController < ApplicationController
   before_action :authenticate_user!, only: [:create]

  def create
    if UserRoom.where(user_id: current_user.id, room_id: params[:chat][:room_id]).present?
      # @chat = Chat.create(params.require(:chat).permit(:user_id, :message, :room_id).merge(user_id: current_user.id))
      @chat = Chat.new(message_params)
      # @chat.user_id = current_user.id
      @chat.save

    # 　チャットの一覧のためのデータ取得
    # @room = Room.find(params[:chat][:room_id])
    room_id = @chat.room_id 
    @room = Room.find(room_id)
    @chats = @room.chats

    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    # redirect_to "/rooms/#{@chat.room_id}"
    # redirect_to room_path(@chat.room_id)
  end

# .merge(user_id: current_user.id)


private
  def message_params
    params.require(:chat).permit(:message, :room_id).merge(user_id: current_user.id)
  end


end
