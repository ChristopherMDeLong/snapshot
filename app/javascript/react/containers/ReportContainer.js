import React, { Component } from "react";
import ReportInfoTile from "../components/ReportInfoTile";

class ReportContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      date:"",
      food_sales:"",
      liquor_sales:"",
      food_expenses:"",
      liquor_expenses:"",
      front_house_payroll:"",
      back_house_payroll:"",
      manager_payroll:"",
      headcount:""
    };
    this.fetchReportData=this.fetchReportData.bind(this)
  }

  componentDidMount(){
    let id = this.props.params.id;
    this.fetchReportData(id)
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
        date: body.date,
        food_sales:body.food_sales,
        liquor_sales:body.liquor_sales,
        food_expenses:body.food_expenses,
        liquor_expenses:body.liquor_expenses,
        front_house_payroll:body.front_house_payroll,
        back_house_payroll:body.back_house_payroll,
        manager_payroll:body.manager_payroll,
        headcount:body.headcount
      });
    })
  }

  render(){
    return(
      <div className="row">
        <div className="restaurant-show-row">
          <ReportInfoTile
          date={this.state.date}
          food_sales={this.state.food_sales}
          liquor_sales={this.state.liquor_sales}
          food_expenses={this.state.food_expenses}
          liquor_expenses={this.state.liquor_expenses}
          front_house_payroll={this.state.front_house_payroll}
          back_house_payroll={this.state.back_house_payroll}
          manager_payroll={this.state.manager_payroll}
          headcount={this.state.headcount}
          />
        </div>
      </div>
    )
  }
}
export default ReportContainer;
