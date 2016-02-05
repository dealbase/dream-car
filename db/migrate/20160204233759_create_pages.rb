class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.float :amount

      t.timestamps null: false
    end
  end
end
