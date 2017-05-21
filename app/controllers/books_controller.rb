class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @search = Book.search params[:q]
    @books = @search.result.order_by_time.page(params[:page]).per_page 8
  end

  def show
    @reviews = @book.reviews
    @user_book =
      if current_user.mark_book? @book
        current_user.user_books.find_by book: @book
      else
        current_user.user_books.new book: @book
      end
    @rating = current_user.ratings
      .find_or_initialize_by book_id: @book.id, review_id: nil
  end
end
