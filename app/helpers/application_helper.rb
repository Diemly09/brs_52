module ApplicationHelper
  def full_title page_title = ""
    base_title = t "title_page"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def flash_class level
    case level
    when :notice then "alert-info"
    when :error then "alert-error"
    when :alert then "alert-warning"
    when :success then "alert-success"
    end
  end

  def flash_message flash_type, *params
    if params.empty?
      t "flashs.messages.#{flash_type}", model_name: controller_name.classify
    else
      t "flashs.messages.#{flash_type}", models_name: params[0].join(", ") unless params[0].empty?
    end
  end

  def user_avatar user
    avatar = user.avatar.blank? ? "default-user-img.png" : user.avatar
    image_tag avatar,
      class: "img-circle profile-user-img img-responsive img-circle",
      alt: t("users.headers.avatar")
  end

  def book_image book
    image = book.image.blank? ? "book-default.jpg" : book.image
    image_tag image,
      alt: t("books.headers.image")
  end

  def i18n_enum model_name, enum
    enum = enum.to_s.pluralize
    model_name = model_name.to_s
    model_name.classify.constantize.public_send(enum).keys.map do |key|
      OpenStruct.new key: key, value: t("#{model_name.pluralize}.#{enum}.#{key}")
    end.flatten
  end

  def display_notification notification
    case notification.action
    when "follower"
      "#{notification.user.email} #{notification.action} you!"
    when "commented"
      "#{notification.user.email} #{notification.action} your review!"
    when "replied"
      "#{notification.user.email} #{notification.action} your comment!"
    when "liked"
      if notification.notifiable_type == "Comment"
        "#{notification.user.email} #{notification.action} your comment!"
      else
        "#{notification.user.email} #{notification.action} your review!"
      end
    when "reported"
      "#{notification.user.email} #{notification.action} review!"
    when "banned"
      "#{notification.user.email} #{notification.action} your review!"
    when "reviewed"
      "#{notification.user.email} #{notification.action} #{notification.notifiable.title}"
    when "requested"
      "#{notification.user.email} #{notification.action} a book with title #{notification.notifiable.title}"
    when "accepted" || "rejected"
      "#{notification.user.email} #{notification.action} your request!"
    end
  end

  def link_to_add_fields name, f, type
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send "#{type}_fields", new_object, child_index: id do |builder|
      render type.to_s + "_fields", f: builder
    end
    link_to name, "#", class: "add_fields btn btn-success",
      data: {id: id, fields: fields.gsub("\n", "")}
  end

  def mark_book book
    if current_user.mark_book? book
      current_user.user_books.find_by book: book
    else
      current_user.user_books.new book: book
    end
  end

  def image_book book
    book.image ? book.image : "book.jpg"
  end

  def request_class request
    case request.status
    when "in_progress"
      "label label-info"
    when "accepted"
      "label label-success"
    when "rejected"
      "label label-default"
    end
  end
end
