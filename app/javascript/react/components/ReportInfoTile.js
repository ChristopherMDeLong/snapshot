import React from "react";

const ReportInfoTile = props => {
  return(
      <div className="rest-show">
      <h5>Date: {props.date}</h5>
      <h5>Food Sales: ${props.food_sales}</h5>
      <h5>Liquor Sales: ${props.liquor_sales}</h5>
      <h5>Total Sales: ${props.food_sales + props.liquor_sales}</h5>
      <h5>Food Expenses: ${props.food_expenses}</h5>
      <h5>Liquor Expenses: ${props.liquor_expenses}</h5>
      <h5>Front of House Payroll: ${props.front_house_payroll}</h5>
      <h5>Back of House Payroll: ${props.back_house_payroll}</h5>
      <h5>Manager Payroll: ${props.manager_payroll}</h5>
      <h5>HeadCount: {props.headcount}</h5>
      </div>
  );
};
export default ReportInfoTile;
