class Batch::DataReset
  def self.data_reset
    # 投稿を全て削除
    BookComment.delete_all
    Favorite.delete_all
    Book.delete_all
    Relationship.delete_all
    Chat.delete_all
    Room.delete_all
    UserRoom.delete_all
    User.delete_all
    p "ユーザーをを全て削除しました"
  end

end