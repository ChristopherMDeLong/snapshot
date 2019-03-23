require 'rails_helper'

RSpec.describe Api::V1::ReportsController, type: :controller do
  let!(:report1) {Report.create(
    id: 2,
    date: "Jan 25, 2019",
    food_sales: 1278.32,
    liquor_sales: 1233.33,
    food_expenses: 400.23,
    liquor_expenses: 300.56,
    front_house_payroll: 500.65,
    back_house_payroll: 343.54,
    manager_payroll: 343.56,
    headcount: 234,
    restaurant_id: 1
  )}

  describe "Get#show" do
    it "reports show page" do

      get :show, params: { id: report1.id }
      returned_json = JSON.parse(response.body)

      expect(response.status). to eq 200
      expect(response.content_type). to eq("application/json")

      expect(returned_json.length). to eq 1
    end
  end
end
