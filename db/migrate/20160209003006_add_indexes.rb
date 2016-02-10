class AddIndexes < ActiveRecord::Migration
  def change
    add_index :rates, :rating
    add_index :blogposts, :rate_count
    add_index :blogposts, :rate_sum
    add_index :blogposts, :autor_ip
  end
end
