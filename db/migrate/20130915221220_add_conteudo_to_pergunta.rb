class AddConteudoToPergunta < ActiveRecord::Migration
  def change
    add_column :pergunta, :conteudo, :text
  end
end
