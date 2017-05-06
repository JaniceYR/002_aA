import React from 'react';

class AutoComplete extends React.Component {
  constructor() {
    super();
    this.nameList = ["j", "janice", "yura", "lee", "test"];
    this.state = {value: ""};
    this.matched = ["j", "janice", "yura", "lee", "test"];
    this.changeValue = this.changeValue.bind(this);
    this.nameMatch = this.nameMatch.bind(this);
  }
  changeValue(e) {
    this.setState({value: e.target.value});
    let matched = this.nameMatch();
  }

  nameMatch() {
    let valueLength = this.state.value.length;
    this.matched = [];
    if (valueLength === 0) {
      this.matched = this.nameList;
      return this.matched;
    }
    this.nameList.forEach( (name) => {
      if (name.slice(0,valueLength) === this.state.value) {
        this.matched.push(name);
      }
    });
    if (this.matched.length === 0) {
      this.matched.push("not matched");
    }
    return this.matched;
  }
  render () {
    return (
      <div>
        <h1>Auto Complete</h1>
        <div className="autocomplete">
          <input className="height_input" name="autoinput" type="text" placeholder="Searching..." value={this.state.value} onChange={this.changeValue}>
          </input>
          <ul>
            {
              this.matched.map((name, idx) => (<li key={`${idx}`}>{`${name}`}</li>))
            }
          </ul>
        </div>
      </div>
    );
  }
}

export default AutoComplete;
