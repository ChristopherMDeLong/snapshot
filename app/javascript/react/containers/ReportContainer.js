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
      yelpReviews:[]
    };

    this.fetchReportData=this.fetchReportData.bind(this)
    this.addAction=this.addAction.bind(this)
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
        headcount:body.report.headcount,
        name: body.restaurant.name,
        address1: body.restaurant.address,
        city: body.restaurant.city,
        state: body.restaurant.state,
        yelpReviews: body.yelp_data
      });
      this.addAction()
    })
  }

  addAction(){
    this.setState({
      totalSales: parseFloat(this.state.foodSales) + parseFloat(this.state.liquorSales),
      totalPayroll:parseFloat(this.state.frontHousePayroll) + parseFloat(this.state.backHousePayroll) + parseFloat(this.state.managerPayroll),
      totalExpenses:parseFloat(this.state.foodExpenses) + parseFloat(this.state.liquorExpenses)
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
          total={this.state.totalSales.toFixed(2)}
          totalPayroll={this.state.totalPayroll.toFixed(2)}
          totalExpenses={this.state.totalExpenses.toFixed(2)}
          reviews={this.state.yelpReviews}
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
