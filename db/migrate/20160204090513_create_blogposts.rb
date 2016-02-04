class CreateBlogposts < ActiveRecord::Migration
  def change
    create_table :blogposts do |t|
      t.string :subj
      t.text :content
      t.inet :autor_ip
      t.references :user, index: true, foreign_key: true
      t.integer :rate_sum, default: 0
      t.integer :rate_count, default: 0

      t.timestamps null: false
    end
  end
end
