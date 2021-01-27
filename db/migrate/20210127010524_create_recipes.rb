class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.datetime :date_created

      t.timestamps
    end
  end
end
