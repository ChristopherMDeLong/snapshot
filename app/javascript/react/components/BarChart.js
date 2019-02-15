import React from 'react';
import { render } from 'react-dom';
import { Chart } from 'react-google-charts';

class BarChart extends React.Component {
    render(){
      let data = [
        ['Expense', 'Amount'],
        ['Food', parseFloat(this.props.foodExpenses)],
        ['Liquor', parseFloat(this.props.liquorExpenses)],
        ['FOH', parseFloat(this.props.frontHousePayroll)],
        ['BOH', parseFloat(this.props.backHousePayroll)],
        ['Manager', parseFloat(this.props.backHousePayroll)]
      ]

      return(
        <div>
          <Chart
            width={600}
            height={300}
            chartType="ColumnChart"
            loader={<div>Loading Chart</div>}
            data={data}
            options={{
              title: 'Expenses',
              vAxis: {
                title: 'Amount',
                minValue: 0,
              },
              animation: {
                startup: true,
                easing: 'linear',
                duration: 1500,
              },
              enableInteractivity: true,
              }}
            />
      </div>
    );
  }
}

export default BarChart
