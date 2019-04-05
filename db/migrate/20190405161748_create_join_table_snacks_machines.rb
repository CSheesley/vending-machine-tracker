class CreateJoinTableSnacksMachines < ActiveRecord::Migration[5.1]
  def change
    create_join_table :snacks, :machines do |t|
      t.references :snacks, foreign_key: true
      t.references :machines, foreign_key: true
    end
  end
end
