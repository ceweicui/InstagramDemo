class CreatePhotoposts < ActiveRecord::Migration[5.1]
  def change
    create_table :photoposts do |t|
      t.string :caption

      t.timestamps
    end
  end
end
