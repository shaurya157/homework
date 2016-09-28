class CreatePeopleTable < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :house_id, null: false
      t.timestamps
    end
  end
end
