class RequestsController < ApplicationController
  load_resource except: :create
  authorize_resource

  def index
    @requests = current_user.requests
  end

  def new

  end

  def create
    @request = current_user.requests.new request_params
    if @request.save
      flash[:success] = flash_message "created"
      redirect_to requests_path
    else
      flash[:alert] = flash_message "not_created"
      render :new
    end
  end

  def edit

  end

  def update
    if @request.update request_params
      flash[:success] = flash_message "updated"
      redirect_to requests_path
    else
      flash[:success] = flash_message "not_updated"
      render :edit
    end
  end

  def destroy
    if @request.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:alert] = flash_message "not_deleted"
    end
    redirect_to requests_path
  end

  private

  def request_params
    params.require(:request).permit Request::ATTRIBUTE_PARAMS
  end
end
