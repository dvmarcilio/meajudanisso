class CreateAnswers < ActiveRecord::Migration
  def up
    create_table :answers do |t| 
      t.text :conteudo
      t.integer :votos
      t.references :question
    end
  end

  def down
  end
end
