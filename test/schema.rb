# vendor/plugins/date_checkbox/test/schema.rb

ActiveRecord::Schema.define(:version => 0) do
  create_table :published_at_posts, :force => true do |t|
    t.string :name
    t.datetime :published_at
    t.timestamps
  end
end

