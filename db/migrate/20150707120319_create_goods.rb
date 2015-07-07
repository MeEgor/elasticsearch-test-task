class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :article, null: false, default: ""
      t.string :name, null: false, default: ""

      t.timestamps null: false
    end
  end
end
