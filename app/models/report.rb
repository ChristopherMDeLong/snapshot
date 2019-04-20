class Report < ApplicationRecord
  validates_presence_of :date, :food_sales, :liquor_sales, :food_expenses, :liquor_expenses, :front_house_payroll, :back_house_payroll, :manager_payroll, :headcount, :restaurant_id
  belongs_to :restaurant, required: true
  attr_reader :total_sales, :total_payroll, :total_expenses

  def sales_totals
    @total_sales = food_sales + liquor_sales
  end

  def expense_totals
    @total_expenses = food_expenses + liquor_expenses
  end

  def payroll_totals
    @total_payroll = front_house_payroll + back_house_payroll + manager_payroll
  end
end
