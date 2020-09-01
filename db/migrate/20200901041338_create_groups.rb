class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :title
      t.text :description
      t.string :service

      t.timestamps
    end
  end
end
