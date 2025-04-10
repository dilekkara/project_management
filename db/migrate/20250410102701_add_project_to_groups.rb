class AddProjectToGroups < ActiveRecord::Migration[7.1]
  def change
    add_reference :groups, :project, foreign_key: true
  end
  
end
