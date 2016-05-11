class ChangePublicOnTopics < ActiveRecord::Migration
  def change
    change_column_null :topics, :public, false
  end
end
