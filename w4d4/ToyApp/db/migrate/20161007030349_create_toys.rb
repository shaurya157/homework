class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name, null: false, unique: true, index: true
      t.references :toyable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
