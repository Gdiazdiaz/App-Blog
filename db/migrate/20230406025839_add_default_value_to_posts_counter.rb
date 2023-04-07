class AddDefaultValueToPostsCounter < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :postsCounter, 0
  end
end
