class Report < ApplicationRecord
  validates_presence_of :date, :food_sales, :liquor_sales, :food_expenses, :liquor_expenses, :front_house_payroll, :back_house_payroll, :manager_payroll, :headcount, :restaurant_id
  belongs_to :restaurant, required: true
end
