import React, { Component } from 'react';
import './App.css';
import { Constants, Note } from 'shared';

class App extends Component {
    render() {
        return (
            <div>
                {Constants.API_BASE_URL}
                <div>{new Note(12, "test", "test").id}</div>
            </div>
        );
    }
}

export default App;
