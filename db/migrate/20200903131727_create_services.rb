class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :title
      t.string :kind
      t.string :description
      t.decimal :value

      t.timestamps
    end
  end
end
