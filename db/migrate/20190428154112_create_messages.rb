class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.references :conversation, index: true, foreign_key: true

      t.timestamps
    end
  end
end
