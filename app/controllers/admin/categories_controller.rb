class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index

  end

  def new
  end

  def create
    if @category.save
      flash[:success] = flash_message "created"
      redirect_to [:admin, @category]
    else
      flash[:alert] = flash_message "not_created"
      render :new
    end
  end

  def show
    @books = @category.books
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = flash_message "updated"
      redirect_to [:admin, @category]
    else
      flash[:alert] = flash_message "not_updated"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:alert] = flash_message "not_deleted"
    end
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit Category::ATTRIBUTES_PARAMS
  end
end
