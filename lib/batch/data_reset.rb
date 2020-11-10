class Batch::DataReset
  # def self.daily_mail
  #   user = User.find(params[:id]) #contact_mailer.rbの引数を指定
  #   user.update(contact_params)
  #   user = user.user
  #   DailyMailer.daily_rep(user).deliver
  #   p "メール送信しました"
  # end

    def self.daily_mail

      @user = User.all
      DailyMailer.daily_reply(@user).deliver
      p "メール送信しました"
    end


    # def main
    #   name = "中村"
    #   res = kun(name)
    #   # res = "中村くん"
    #   put res
    # end

    # def kun(user)
    #   # user = 中村
    #   return user + "くん"
    # end


#   def create
#     Book.new(book_params)
#   end

#   def book_params
#     params.require(:book).permit(:title, :body, :profile_image)
#   end

end


# class Batch::DataReset
#   def self.data_reset
#     # 投稿を全て削除
#     BookComment.delete_all
#     Favorite.delete_all
#     Book.delete_all
#     Relationship.delete_all
#     Chat.delete_all
#     Room.delete_all
#     UserRoom.delete_all
#     User.delete_all
#     p "ユーザーをを全て削除しました"
#   end

# end