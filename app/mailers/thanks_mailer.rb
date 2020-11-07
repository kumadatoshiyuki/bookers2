class ThanksMailer < ApplicationMailer

  def send_when_admin_reply(user) #メソッドに対して引数を設定
    @user = user #ユーザー情報
    # @answer = contact.reply_text #返信内容
    mail to: user.email, subject: '【Bookers2】 ご登録頂きありがとうございます'
  end
end
