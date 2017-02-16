class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.references :user, foreign_key: true
      t.references :service_provider, foreign_key: true 
      t.timestamps null: false
    end
  end
end
