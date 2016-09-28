class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :information

      t.timestamps
    end
    
    add_reference :projects, :moderator, index: true
    add_reference :projects, :projectleader, index: true
    
    create_table :projects_users, id: false do |t|
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
    end
  end
end
