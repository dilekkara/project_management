class AddQuotaToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :quota, :integer
  end
end
