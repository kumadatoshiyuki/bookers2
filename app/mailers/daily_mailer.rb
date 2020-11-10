class DailyMailer < ApplicationMailer

# users
# ID:NAME
# 1:A
# 2:B
# 3:C
# 4:D

  def daily_reply(users) #メソッドに対して引数を設定
    users.each do |user|
    @user = user #ユーザー情報
    # @answer = contact.reply_text #返信内容
    mail to: user.email, subject: '【Bookers2】 バッチ処理でございます'
    end
  end
end
