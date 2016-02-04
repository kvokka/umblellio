class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :subj
      t.text :content
      t.inet :autor_ip
      t.references :user, index: true, foreign_key: true
      t.integer :rating, limit: 2

      t.timestamps null: false
    end
  end
end
