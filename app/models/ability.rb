class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.is_admin?
      can :manage, :all
    else
      can :show, Category
      can [:create, :new, :show], Review
      can [:edit, :update, :destroy], Review, Review do |review|
        review.user_id == user.id
      end
      can [:create, :new, :show], Comment
      can [:edit, :update, :destroy], Comment, Comment do |comment|
        comment.user_id == user.id
      end
      can [:index, :show], Book
      can :create, UserBook
      can :update, UserBook, UserBook do |user_book|
        user_book.user_id == user.id
      end
      can :create, Report
      can :update, Notification, Notification do |notification|
        notification.recipient_id == user.id
      end
      can :destroy, FavoriteBook, FavoriteBook do |favorite_book|
        favorite_book.user_id == user.id
      end
      can [:index, :new, :create], Request
      can [:edit, :update, :destroy], Request, Request do |request|
        request.user_id == user.id
      end
    end
  end
end
