class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :activities, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :user_books, dependent: :destroy
  has_many :mark_books, through: :user_books, source: :book
  has_many :favorite_books, dependent: :destroy
  has_many :books, through: :favorite_books
  has_many :active_relationships, class_name:  Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name:  Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :likes, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id
  has_many :reports, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :requests, dependent: :destroy

  mount_uploader :avatar, ImageUploader

  def like target
    likes.find_by likeable_id: target, likeable_type: target.class
  end

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

  def current_user? user
    self == user
  end

  def mark_book? book
    mark_books.include? book
  end

  def favorite book
    favorite_books.find_by book: book
  end

  private

  def password_required?
    new_record? ? super : false
  end
end
