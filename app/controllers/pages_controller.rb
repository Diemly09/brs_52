class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @books = Book.all.limit 50
    @categories = Category.all
    if valid_page?
      if user_signed_in?
        @book_challenge = Book.book_challenge
        @user_book =
          if current_user.mark_book? @book_challenge.first
            current_user.user_books.find_by book: @book_challenge.first
          else
            current_user.user_books.new book: @book_challenge.first
          end
        @reviews = Review.order_by_created_at.page(params[:page]).per_page 5
        @categories = Category.all
        render template: "pages/#{params[:name_page]}"
      else
        redirect_to new_user_session_path
      end
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private

  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:name_page]}.html.erb"))
  end
end
