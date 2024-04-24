class AddIndexesToTests < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, :category_id unless index_exists?(:tests, :category_id)
    add_index :tests, :author_id unless index_exists?(:tests, :author_id)
  end
end
