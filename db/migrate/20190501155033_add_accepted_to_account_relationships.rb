class AddAcceptedToAccountRelationships < ActiveRecord::Migration[6.0]
  def change
    add_column :account_relationships, :accepted, :boolean, default: true
  end
end
