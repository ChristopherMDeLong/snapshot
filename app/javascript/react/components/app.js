import React from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import ReportContainer from "../containers/ReportContainer";

const App = (props) => {
  return (
    <div>
      <Router history={browserHistory}>
        <Route path="/reports/:id" component={ReportContainer} />
      </Router>
    </div>
  );
};

export default App
