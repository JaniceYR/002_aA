import React from 'react';

class Clock extends React.Component {
  constructor() {
    super();
    this.state = {currentTime: new Date()};
    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount(){
    this.intervalId.clearInterval();
  }

  tick () {
    this.setState( {currentTime: new Date()} );
  }

  render () {
    let date = this.state.currentTime.getDate();
    let month = this.state.currentTime.getMonth();
    let year = this.state.currentTime.getFullYear();
    let hour = this.state.currentTime.getHours();
    let min = this.state.currentTime.getMinutes();
    let second = this.state.currentTime.getSeconds();

    return (
      <div>
        <h1>Clock by J</h1>
        <div className='clock'>
          <div className='clock_inside'>
            <p>
              <span>Time: </span>
              <span>{hour} : {min} : {second}</span>
            </p>
            <p>
              <span>Date: </span>
              <span>{date} / {month+1} , {year}</span>
            </p>
          </div>
        </div>
      </div>
    );

  }
}

export default Clock;
