# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Diem Ly Vu",
  email: "admin@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  is_admin: true)

User.create!(name: "Test",
  email: "test@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  avatar: File.open(File.join(Rails.root, "app/assets/images/images.jpg")))

User.create!(name: "Diem Ly",
  email: "ly@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  avatar: File.open(File.join(Rails.root, "app/assets/images/images.jpg")))

Category.create! ([
  {name: "Kinh Điển"},
  {name: "Tình Cảm Lãng Mạn"},
  {name: "Tiểu Thuyết"},
  {name: "Truyện Ngắn"},
  {name: "Thiếu Nhi"}
  ])

Book.create!([
  {author: "Jonhanna Lindsey", description: "Ophelia Reid, một tiểu thư xinh đẹp không ai sánh bằng nhưng cũng là người phụ nữ đáng ghét nhất trên khắp Anh quốc. Cố tình chống đối cuộc đính hôn mà người cha của cô đã sắp đặt với Duncan MacTavish - một hầu tước tương lai, Ophelia đã tham dự Mùa vũ hội ở London và muốn tự mình lựa chọn một người chồng giàu có. Nhưng trên đường về nhà, vài chuyện bất ngờ đã xảy ra...",
    title: "Nơi em thuộc về", category_id: 2, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/NoiEmThuocVe.jpg"))},
  {author: "Ernest Hemingway", description: "Ông già và Biển cả (tên tiếng Anh: The Old Man and the Sea) là một tiểu thuyết ngắn được Ernest Hemingway viết ở Cuba năm 1951 và xuất bản năm 1952. Nó là truyện ngắn dạng viễn tưởng cuối cùng được viết bởi Hemingway. Đây cũng là tác phẩm nổi tiếng và là một trong những đỉnh cao trong sự nghiệp sáng tác của nhà văn. Tác phẩm này đoạt giải Pulitzer cho tác phẩm hư cấu năm 1953. Nó cũng góp phần quan trọng để nhà văn được nhận Giải Nobel văn học năm 1954.",
    title: "Ông già và biển cả", category_id: 1, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/OngGiaVaBienCa.jpg"))},
  {author: "J.R.R Tolkien", description: "Câu chuyện của Anh Chàng Hobbit là một chuyến phiêu lưu, khi Bilbo Baggins bị cuốn vào chuyến phiêu lưu giành lại xứ sở của những người lùn. Chuyến đi ấy vốn chẳng bao giờ được cho là thích hợp với một Hobbit chỉ thích ăn thức ngon, ở chỗ đẹp. Nhưng rồi Bilbo đã tham gia, đã bị cuốn vào rồi có thể trở về. Chuyến phiêu lưu trở thành bài học về cuộc sống, về con người.",
    title: "Anh Chàng Hobbit", category_id: 3, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/AnhChangHobbit.jpg"))},
  {author: "Alexander Grin", description: "Một hôm, ông già Ê-giơn đã kể cho cô bé A-xôn câu chuyện về chàng hoàng tử lái con tàu có cánh buồm đỏ thắm đến đón ý trung nhân. A- xôn đã sống qua tuổi thơ với khát vọng chờ mong cánh buồm đỏ thắm. Rồi một ngày, con tàu mang cánh buồm rực rỡ ấy đã ghé vào làng Ca-péc-na để đón A-xôn.",
    title: "Cánh Buồm Đỏ Thắm", category_id: 4, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/CanhBuomDoTham.jpg"))},
  {author: "Hà Huyền Mỹ", description: "Tuổi thanh xuân giống như một cơn mưa rào, sôi nổi, đầy nhiệt thành nhưng cũng chợt đến, chợt đi để lại nhiều nhớ thương, nuối tiếc. Mỗi người chúng ta đều từng trải qua một quãng thời gian mãi khắc ghi như thế, yêu có, hờn giận có, ngọt ngào có, đắng cay, tủi hờn có... Tất cả những cung bậc cảm xúc đó hòa hợp lại tạo nên một bản tình ca say đắm của tuổi trẻ.",
    title: "Can Đảm Yêu", category_id: 2, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/CanDamYeu.jpg"))},
  {author: "James Albert Michener", description: "Sáu Người Đi Khắp Thế Gian, như cái tên đã chuyển tải, là một cuộc hành trình của những kẻ lang bạt, hơn thế, là hành trình của những con người miệt mài trên những chặng đường vô tận để tìm cho mình một nơi dừng chân. Sáu con người, Joe, Cato, Yigal, Gretchen, Britta và Monica, là sáu mảnh đời, sáu số phận. Điểm chung duy nhất giữa họ chính là đều đang chạy trốn hiện tại đầy hỗn loạn.",
    title: "Sáu người đi khắp thế gian", category_id: 4, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/6nguoiDiKhapTheGian.jpg"))},
  {author: "Minh Long - Khánh Hòa", description: "Việt Nam có một kho tàng truyện cổ tích vô cùng đa dạng và phong phú. Mỗi truyện cổ tích không đơn thuần mang giá trị giải trí mà ẩn chứa trong đó là những bài học bổ ích mang tính giáo dục cao. Do đó, hầu hết các bé thiếu nhi đều được ông bà, cha mẹ, thầy cô kể cho nghe những câu chuyện cổ tích.",
    title: "Tấm Cám", category_id: 5, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/TamCam.jpg"))},
  {author: "Jonhanna Lindsey", description: "Ophelia Reid, một tiểu thư xinh đẹp không ai sánh bằng nhưng cũng là người phụ nữ đáng ghét nhất trên khắp Anh quốc. Cố tình chống đối cuộc đính hôn mà người cha của cô đã sắp đặt với Duncan MacTavish - một hầu tước tương lai, Ophelia đã tham dự Mùa vũ hội ở London và muốn tự mình lựa chọn một người chồng giàu có. Nhưng trên đường về nhà, vài chuyện bất ngờ đã xảy ra...",
    title: "Nơi em thuộc về", category_id: 2, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/NoiEmThuocVe.jpg"))},
  {author: "Ernest Hemingway", description: "Ông già và Biển cả (tên tiếng Anh: The Old Man and the Sea) là một tiểu thuyết ngắn được Ernest Hemingway viết ở Cuba năm 1951 và xuất bản năm 1952. Nó là truyện ngắn dạng viễn tưởng cuối cùng được viết bởi Hemingway. Đây cũng là tác phẩm nổi tiếng và là một trong những đỉnh cao trong sự nghiệp sáng tác của nhà văn. Tác phẩm này đoạt giải Pulitzer cho tác phẩm hư cấu năm 1953. Nó cũng góp phần quan trọng để nhà văn được nhận Giải Nobel văn học năm 1954.",
    title: "Ông già và biển cả", category_id: 1, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/OngGiaVaBienCa.jpg"))},
  {author: "J.R.R Tolkien", description: "Câu chuyện của Anh Chàng Hobbit là một chuyến phiêu lưu, khi Bilbo Baggins bị cuốn vào chuyến phiêu lưu giành lại xứ sở của những người lùn. Chuyến đi ấy vốn chẳng bao giờ được cho là thích hợp với một Hobbit chỉ thích ăn thức ngon, ở chỗ đẹp. Nhưng rồi Bilbo đã tham gia, đã bị cuốn vào rồi có thể trở về. Chuyến phiêu lưu trở thành bài học về cuộc sống, về con người.",
    title: "Anh Chàng Hobbit", category_id: 3, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/AnhChangHobbit.jpg"))},
  {author: "Alexander Grin", description: "Một hôm, ông già Ê-giơn đã kể cho cô bé A-xôn câu chuyện về chàng hoàng tử lái con tàu có cánh buồm đỏ thắm đến đón ý trung nhân. A- xôn đã sống qua tuổi thơ với khát vọng chờ mong cánh buồm đỏ thắm. Rồi một ngày, con tàu mang cánh buồm rực rỡ ấy đã ghé vào làng Ca-péc-na để đón A-xôn.",
    title: "Cánh Buồm Đỏ Thắm", category_id: 4, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/CanhBuomDoTham.jpg"))},
  {author: "Hà Huyền Mỹ", description: "Tuổi thanh xuân giống như một cơn mưa rào, sôi nổi, đầy nhiệt thành nhưng cũng chợt đến, chợt đi để lại nhiều nhớ thương, nuối tiếc. Mỗi người chúng ta đều từng trải qua một quãng thời gian mãi khắc ghi như thế, yêu có, hờn giận có, ngọt ngào có, đắng cay, tủi hờn có... Tất cả những cung bậc cảm xúc đó hòa hợp lại tạo nên một bản tình ca say đắm của tuổi trẻ.",
    title: "Can Đảm Yêu", category_id: 2, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/CanDamYeu.jpg"))},
  {author: "James Albert Michener", description: "Sáu Người Đi Khắp Thế Gian, như cái tên đã chuyển tải, là một cuộc hành trình của những kẻ lang bạt, hơn thế, là hành trình của những con người miệt mài trên những chặng đường vô tận để tìm cho mình một nơi dừng chân. Sáu con người, Joe, Cato, Yigal, Gretchen, Britta và Monica, là sáu mảnh đời, sáu số phận. Điểm chung duy nhất giữa họ chính là đều đang chạy trốn hiện tại đầy hỗn loạn.",
    title: "Sáu người đi khắp thế gian", category_id: 4, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/6nguoiDiKhapTheGian.jpg"))},
  {author: "Minh Long - Khánh Hòa", description: "Việt Nam có một kho tàng truyện cổ tích vô cùng đa dạng và phong phú. Mỗi truyện cổ tích không đơn thuần mang giá trị giải trí mà ẩn chứa trong đó là những bài học bổ ích mang tính giáo dục cao. Do đó, hầu hết các bé thiếu nhi đều được ông bà, cha mẹ, thầy cô kể cho nghe những câu chuyện cổ tích.",
    title: "Tấm Cám", category_id: 5, publish_date: Date.today,
    image: File.open(File.join(Rails.root, "app/assets/images/6nguoiDiKhapTheGian.jpg"))}
])

10.times do |n|
  review = Review.create! content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
    book_id: n + 1, user_id: 2, rating_attributes: {rating: 3, user_id: 1, book_id: n + 1}
end

10.times do |n|
  Rating.create! rating: 3, user_id: 1, book_id: n + 1
end

Comment.create! content: "HHHH", review_id: 1, user_id: 1
