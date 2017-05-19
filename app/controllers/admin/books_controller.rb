class Admin::BooksController < ApplicationController
  load_and_authorize_resource
  load_and_authorize_resource :category, only: [:new, :create]

  def index
    @search = Book.search params[:q]
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
    @books = @search.result
  end

  def new
  end

  def create
    if @book.save
      flash[:success] = flash_message "created"
      redirect_to [:admin, @book]
    else
      flash[:alert] = flash_message "not_created"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update_attributes book_params
      flash[:success] = flash_message "updated"
      redirect_to [:admin, @book.category]
    else
      flash[:alert] = flash_message "not_updated"
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:alert] = flash_message "not_deleted"
    end
    redirect_to admin_books_path
  end

  private

  def book_params
    params.require(:book).permit Book::ATTRIBUTES_PARAMS
  end
end
