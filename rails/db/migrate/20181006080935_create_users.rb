class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, &:timestamps
  end
end
