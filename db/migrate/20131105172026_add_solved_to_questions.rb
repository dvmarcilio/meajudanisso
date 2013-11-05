class AddSolvedToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :solved, :boolean, :default => false
  end
end
