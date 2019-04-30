class CreateAccountSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :account_settings do |t|
      t.boolean :private_profile, default: false
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
