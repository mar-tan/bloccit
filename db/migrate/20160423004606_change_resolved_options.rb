class ChangeResolvedOptions < ActiveRecord::Migration
  def change
    change_column_default :questions, :resolved, false
    change_column_null :questions, :resolved, false
  end
end
