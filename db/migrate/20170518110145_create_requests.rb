class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.string :title
      t.string :author
      t.datetime :publish_date
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
