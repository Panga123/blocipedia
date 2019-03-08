class CreateSonomas < ActiveRecord::Migration[5.2]
  def change
    create_table :sonomas do |t|
      t.string :title
      t.text :body
      t.boolean :private
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
