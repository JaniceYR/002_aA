import React from 'react';

class Weather extends React.Component {
  constructor() {
    super();
    this.state = {
      weather: null
    };
    this.getWeatherAPI = this.getWeatherAPI.bind(this);
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition(this.getWeatherAPI);
  }

  getWeatherAPI(location) {
    let lat = location.coords.latitude;
    let long = location.coords.longitude;
    const apiKey = 'c259e91091fdc275fc578ff377c9e4b6';

    let url = 'http://api.openweathermap.org/data/2.5/weather?';
    url = url + 'lat=' + lat + "&lon=" + long + "&APPID=" + apiKey;

    let request = new XMLHttpRequest();
    request.onreadystatechange = () => {
      if (request.status === 200 && request.readyState === XMLHttpRequest.DONE) {
        const data = JSON.parse(request.responseText);
        this.setState({weather: data});
      }
    };

    request.open('GET', url, true);
    request.send();
  }

  render(){

    if(this.state.weather) {
      let cityName = this.state.weather.name;
      let temperture = this.state.weather.main.temp;

      return(
        <div>
          <h1>Weather </h1>
          <div className='weather'>
            <div className='weather_inside'>

              <p>
                <span>City: </span>
                <span>{cityName}</span>
              </p>
              <p>
                <span></span>
                <span>{Math.floor(temperture- 273.15)} °C  ({Math.floor(temperture* 9/5 - 459.67)} °F)</span>
              </p>
            </div>
          </div>
        </div>
      );
    }
    else {
      return(
        <div>
          <h1>Weather</h1>
            <div className='weather'>
              <div className='weather_inside'>
                <p><span>(...loading)</span></p>
                <p><span></span></p>
              </div>
            </div>
        </div>
      );
    }

  }
}

export default Weather;
