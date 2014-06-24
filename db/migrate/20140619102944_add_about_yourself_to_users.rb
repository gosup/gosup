class AddAboutYourselfToUsers < ActiveRecord::Migration
  def change
    add_column :users, :about_yourself, :string
  end
end
