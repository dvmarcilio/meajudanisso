class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :titulo
      t.text :conteudo
      t.integer :votos
      
      t.timestamps
    end
  end
end
