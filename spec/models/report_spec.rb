require 'spec_helper'

describe Report do

  it { should have_valid(:date).when("Jan 20th, 2019") }
  it { should_not have_valid(:date).when(nil, "") }

  it { should have_valid(:food_sales).when(679.34, 7878, "5516.34", "4569") }
  it { should_not have_valid(:food_sales).when(nil, "") }

  it { should have_valid(:liquor_sales).when(679.34, 7878, "5516.34", "4569") }
  it { should_not have_valid(:liquor_sales).when(nil, "") }

  it { should have_valid(:food_expenses).when(679.34, 7878, "5516.34", "4569") }
  it { should_not have_valid(:food_expenses).when(nil, "") }

  it { should have_valid(:liquor_expenses).when(679.34, 7878, "5516.34", "4569") }
  it { should_not have_valid(:liquor_expenses).when(nil, "") }

  it { should have_valid(:headcount).when(679, 7878, "5516", "4569") }
  it { should_not have_valid(:headcount).when(nil, "") }

  it { should have_valid(:front_house_payroll).when(679.34, 7878, "5516.34", "4569") }
  it { should_not have_valid(:front_house_payroll).when(nil, "") }

  it { should have_valid(:back_house_payroll).when(679.34, 7878, "5516.34", "4569") }
  it { should_not have_valid(:back_house_payroll).when(nil, "") }

  it { should have_valid(:manager_payroll).when(679.34, 7878, "5516.34", "4569") }
  it { should_not have_valid(:manager_payroll).when(nil, "") }

  it { should have_valid(:restaurant_id).when(1) }
  it { should_not have_valid(:restaurant_id).when(nil, "") }

  it { should belong_to(:restaurant) }
  
end
