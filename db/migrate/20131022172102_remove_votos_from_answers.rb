class RemoveVotosFromAnswers < ActiveRecord::Migration
  def up
    remove_column :answers, :votos
  end

  def down
    add_column :answers, :votos, :integer
  end
end
