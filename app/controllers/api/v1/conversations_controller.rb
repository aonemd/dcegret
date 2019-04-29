class Api::V1::ConversationsController < Api::SecuredController
  before_action :authenticate_account

  def index
    conversations = Conversation.mine(current_account.id).includes(:messages)
    render json: {
      conversations: ConversationDecorator.decorate_collection(conversations,
                                                               current_account: current_account)
    }
  end

  def show
    my_conversations = Conversation.mine(current_account.id)
    conversation     = my_conversations.where(recipient_id: params[:id]).or(my_conversations.where(sender_id: params[:id])).first
    render json: {
      conversation: ConversationDecorator.new(conversation).decorate(current_account: current_account)
    }
  end

  def create
    recipient    = Account.find_by_id(params[:recipient_id])
    conversation = Conversation.between(current_account.id, params[:recipient_id]).first

    unless conversation.present?
      conversation = Conversation.create!(conversation_params) if recipient.present?
    end
    conversation.messages.create(message_params)

    render json: {
      conversation: ConversationDecorator.new(conversation).decorate(current_account: current_account)
    }
  end

  private

  def conversation_params
    params.permit(:recipient_id).merge(sender_id: current_account.id)
  end

  def message_params
    params.permit(:body).merge(account_id: current_account.id)
  end
end
