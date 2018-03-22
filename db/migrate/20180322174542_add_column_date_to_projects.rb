class AddColumnDateToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :date, :datetime
  end
end
