class AddIndexToNameAndArticleInGoods < ActiveRecord::Migration
  def change
    add_index :goods, :name, unique: true
    add_index :goods, :article, unique: true
  end
end
