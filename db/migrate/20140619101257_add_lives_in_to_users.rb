class AddLivesInToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lives_in, :string
  end
end
