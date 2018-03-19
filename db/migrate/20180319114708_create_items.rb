class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :photo
      t.string :url

      t.timestamps
    end
  end
end
