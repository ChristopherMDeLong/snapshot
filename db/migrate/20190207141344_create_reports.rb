class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.date :date, null: false
      t.decimal :food_sales, :precision => 8, :scale => 2, null: false
      t.decimal :liquor_sales, :precision => 8, :scale => 2, null: false
      t.decimal :food_expenses, :precision => 8, :scale => 2, null: false
      t.decimal :liquor_expenses, :precision => 8, :scale => 2, null: false
      t.decimal :front_house_payroll, :precision => 8, :scale => 2, null: false
      t.decimal :back_house_payroll, :precision => 8, :scale => 2, null: false
      t.decimal :manager_payroll, :precision => 8, :scale => 2, null: false
      t.integer :headcount, null: false
      t.belongs_to :restaurant, null: false

      t.timestamps null: false
    end
  end
end
