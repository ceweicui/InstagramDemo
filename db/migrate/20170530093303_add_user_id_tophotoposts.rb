class AddUserIdTophotoposts < ActiveRecord::Migration[5.1]
  def change
  	add_reference :photoposts, :user, index: true
    add_foreign_key :photoposts, :users
  end
end
