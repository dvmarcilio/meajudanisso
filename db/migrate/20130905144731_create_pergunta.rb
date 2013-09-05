class CreatePergunta < ActiveRecord::Migration
  def change
    create_table :pergunta do |t|
      t.string :titulo
      t.integer :votos

      t.timestamps
    end
  end
end
