class CreateContactsProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts_projects do |t|
      t.references :contact, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
    end
  end
end
