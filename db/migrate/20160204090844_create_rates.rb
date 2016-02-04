class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :rating, limit: 2
      t.references :blogpost, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
