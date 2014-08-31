class ConversationsController < ApplicationController
	 before_action :conversation, only: [:show]
	 before_filter :authenticate_user!
	 helper_method :mailbox, :conversation
	  
	  def index
	    @conversations ||= current_user.mailbox.inbox.all
	    @con = current_user.mailbox.sentbox.first
		#@filtered_participants = @con.participants.reject do |u| 
		  #u.id == current_user.id
		#end
		@key = @conversations.each do |conversation|
		    conversation.messages.each do |message|
		    	message.sender.first_name
		    end
		 end
	  end

	  def show

	  end

	  def reply
		  current_user.reply_to_conversation(conversation, *message_params(:body, :subject))
		  redirect_to conversation
		end

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def conversation_params(*keys)
    fetch_params(:conversation, *keys)
  end

  def message_params(*keys)
    fetch_params(:message, *keys)
  end

  def fetch_params(key, *subkeys)
    params[key].instance_eval do
      case subkeys.size
      when 0 then self
      when 1 then self[subkeys.first]
      else subkeys.map{|k| self[k] }
      end
    end
  end
end
