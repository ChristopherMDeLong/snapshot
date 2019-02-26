import React from "react";

const ReportInfoTile = props => {

  return(

      <div className="rest-show">
        <h5 className="date">Date: {props.date}</h5>
        <h5>Food Sales: ${props.foodSales}</h5>
        <h5>Liquor Sales: ${props.liquorSales}</h5>
        <h5>Food Expenses: ${props.foodExpenses}</h5>
        <h5>Liquor Expenses: ${props.liquorExpenses}</h5>
        <h5>Front of House Payroll: ${props.frontHousePayroll}</h5>
        <h5>Back of House Payroll: ${props.backHousePayroll}</h5>
        <h5>Manager Payroll: ${props.managerPayroll}</h5>
        <h5>Head Count: {props.headcount}</h5>
        <h5>Total Sales: ${props.total}</h5>
        <h5>Total Payroll: ${props.totalPayroll}</h5>
        <h5>Total Expenses: ${props.totalExpenses}</h5>
        <h5 className="yelp">Yelp Reviews</h5>
          <p>{props.rating[0]} Stars<br />
             {props.text[0]}<br />
             {props.rating[1]} Stars<br />
             {props.text[1]}<br />
             {props.rating[2]} Stars<br />
             {props.text[2]}</p>
      </div>
  );
};
export default ReportInfoTile;
