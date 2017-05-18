class Admin::RequestsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def update
    @request.update status: params[:status]
    Notification.create(recipient: @request.user, user: current_user,
      action: @request.status, notifiable: @request)
    redirect_to admin_requests_path
  end
end
