import React from 'react';
import { render } from 'react-dom';
import { Chart } from 'react-google-charts';
import BarChart from '../components/BarChart';

class ChartsContainer extends React.Component {
  render() {
  
    return (
      <div className={''}>
        <div>
          <BarChart
          foodExpenses={this.props.foodExpenses}
          liquorExpenses={this.props.liquorExpenses}
          frontHousePayroll={this.props.frontHousePayroll}
          backHousePayroll={this.props.backHousePayroll}
          managerPayroll={this.props.managerPayroll}
          />
        </div>
      </div>
    );
  }
}

export default ChartsContainer
