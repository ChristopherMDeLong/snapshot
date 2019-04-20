import React, { Component } from "react";
import ReactDOM from "react-dom";
import ReportInfoTile from "../components/ReportInfoTile";
import ChartsContainer from "./ChartsContainer";

class ReportContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      foodSales:0,
      liquorSales:0,
      foodExpenses:0,
      liquorExpenses:0,
      frontHousePayroll:0,
      backHousePayroll:0,
      managerPayroll:0,
      headcount:0,
      totalSales:0,
      totalPayroll:0,
      totalExpenses:0,
      yelpRating:[],
      yelpText:[]
    };

    this.fetchReportData=this.fetchReportData.bind(this)
  }

  componentDidMount(){
    let id = this.props.params.id;
    this.fetchReportData(id);
  }

  fetchReportData(id){
    fetch(`/api/v1/reports/${id}`)
    .then(response=> {
      if(response.ok){
        return response;
      }else{
        let errorMessage = `${response.status} (${response.statusText})`, error = new Error(errorMessage);
        throw error;
      }
    })
    .then(response=> response.json())
    .then(body => {
      this.setState({
        restaurantId: body.report.restaurant_id,
        date: body.report.date,
        foodSales:body.report.food_sales,
        liquorSales:body.report.liquor_sales,
        foodExpenses:body.report.food_expenses,
        liquorExpenses:body.report.liquor_expenses,
        frontHousePayroll:body.report.front_house_payroll,
        backHousePayroll:body.report.back_house_payroll,
        managerPayroll:body.report.manager_payroll,
        totalSales:body.sales_totals,
        totalPayroll:body.payroll_totals,
        totalExpenses:body.expense_totals,
        headcount:body.report.headcount,
        name: body.restaurant.name,
        address1: body.restaurant.address,
        city: body.restaurant.city,
        state: body.restaurant.state,
        yelpRating: body.yelp_data[0],
        yelpText: body.yelp_data[1]
      });
    })
  }

  render(){

    return(
      <div className="restaurant-show row small-12">
        <div className="column small-6">
          <ReportInfoTile
          date={this.state.date}
          foodSales={this.state.foodSales}
          liquorSales={this.state.liquorSales}
          foodExpenses={this.state.foodExpenses}
          liquorExpenses={this.state.liquorExpenses}
          frontHousePayroll={this.state.frontHousePayroll}
          backHousePayroll={this.state.backHousePayroll}
          managerPayroll={this.state.managerPayroll}
          headcount={this.state.headcount}
          total={this.state.totalSales}
          totalPayroll={this.state.totalPayroll}
          totalExpenses={this.state.totalExpenses}
          rating={this.state.yelpRating}
          text={this.state.yelpText}
          />
        <div className="column small-6 charts-move">
          <ChartsContainer
          foodExpenses={this.state.foodExpenses}
          liquorExpenses={this.state.liquorExpenses}
          frontHousePayroll={this.state.frontHousePayroll}
          backHousePayroll={this.state.backHousePayroll}
          managerPayroll={this.state.managerPayroll}/>
        </div>
      </div>
      </div>
    )
  }
}
export default ReportContainer;
