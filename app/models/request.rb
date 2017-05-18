class Request < ApplicationRecord
  ATTRIBUTE_PARAMS = [:user_id, :status, :title, :author, :publish_date]

  belongs_to :user

  enum status: ["in_progress", "accepted", "rejected"]

  after_create :create_notification
  before_destroy :remove_notification

  private
  def create_notification
    User.where(is_admin: true).each do |admin|
      Notification.create(recipient: admin, user: self.user,
        action: "requested", notifiable: self)
    end
  end

  def remove_notification
    Notification.where(notifiable: self).delete_all
  end
end
