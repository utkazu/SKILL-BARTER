class ChatMessagesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :authenticate_right_user

  def destroy
    # 非同期通信に後程変更予定。
    chat_message = ChatMessage.find(params[:id])
    chat_message.destroy!
    redirect_to request.referer
  end

  private

  def authenticate_right_user
    if ChatMessage.find(params[:id]).user != current_user
      redirect_to root_path, warning: "適切なユーザーではありません。"
    end
  end
end
