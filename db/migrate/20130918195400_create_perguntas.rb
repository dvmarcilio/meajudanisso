class CreatePerguntas < ActiveRecord::Migration
  def change
    create_table :perguntas do |t|
      t.string :titulo
      t.text :conteudo
      t.integer :votos
      
      t.timestamps
    end
  end
end
