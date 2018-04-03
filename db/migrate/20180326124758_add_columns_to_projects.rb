class AddColumnsToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :client_first_name, :string
    add_column :projects, :client_last_name, :string
    add_column :projects, :client_email, :string
  end
end
