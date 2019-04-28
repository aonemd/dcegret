class Api::V1::ConversationsController < Api::SecuredController
  before_action :authenticate_account

  def index
    conversations = Conversation.mine(current_account.id)
    render json: {
      conversations: ConversationDecorator.decorate_collection(conversations)
    }
  end

  def show
    conversation = Conversation.mine(current_account.id).find(params[:id])
    render json: {
      conversation: ConversationDecorator.new(conversation).decorate
    }
  end

  def create
    recipient    = Account.find_by_id(params[:recipient_id])
    conversation = Conversation.between(current_account.id, params[:recipient_id]).first

    unless conversation.present?
      conversation = Conversation.create!(conversation_params) if recipient.present?
    end
    conversation.messages.create(message_params)

    respond_with ConversationDecorator.new(conversation).decorate
  end

  private

  def conversation_params
    params.permit(:recipient_id).merge(sender_id: current_account.id)
  end

  def message_params
    params.permit(:body).merge(account_id: current_account.id)
  end
end
