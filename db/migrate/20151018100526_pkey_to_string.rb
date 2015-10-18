class PkeyToString < ActiveRecord::Migration
  def change
  	change_column :items, :permalink, :string
  end
end
