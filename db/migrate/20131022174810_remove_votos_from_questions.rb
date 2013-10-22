class RemoveVotosFromQuestions < ActiveRecord::Migration
  def up
    remove_column :questions, :votos
  end

  def down
    add_column :questions, :votos, :integer
  end
end
