class AddStatusToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :status, :string, default: "pending"
  end
end
