class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :nombre
      t.string :foto_url
      t.boolean :status

      t.timestamps
    end
  end
end
