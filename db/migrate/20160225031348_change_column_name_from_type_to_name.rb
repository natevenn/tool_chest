class ChangeColumnNameFromTypeToName < ActiveRecord::Migration
  def change
    rename_column :categories, :type, :name
  end
end