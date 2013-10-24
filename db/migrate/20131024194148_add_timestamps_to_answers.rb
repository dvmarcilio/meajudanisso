class AddTimestampsToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :created_at, :datetime
    add column :answers, :updated_at, :datetime
  end
end
