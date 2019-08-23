class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  has_one :notification

  validates_presence_of :content, :conversation_id, :user_id
  after_create_commit :create_notification

  def message_time
    self.created_at.strftime("%v")
  end

  private

    def create_notification
      if self.conversation.sender_id == self.user_id
        sender = User.find(self.conversation.sender_id)
        Notification.create(content: "New message from #{sender.fullname}", user_id: self.conversation.recipient_id,message_id: self.id)
      else
        sender = User.find(self.conversation.recipient_id)
<<<<<<< HEAD
        Notification.create(content: "New message from #{sender.fullname}", user_id: self.conversation.sender_id,message_id: self.id)
=======
        Notification.create(content: "New message from #{sender.fullname}", user_id: self.conversation.sender_id, message_id: self.id)
>>>>>>> 4eaadf2eca67b198f7b7c290ce30a19d96d15d6e
      end
    end
  end
end