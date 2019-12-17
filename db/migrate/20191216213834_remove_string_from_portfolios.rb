class RemoveStringFromPortfolios < ActiveRecord::Migration[5.2]
  def change
    remove_column :portfolios, :string, :string
  end
end
