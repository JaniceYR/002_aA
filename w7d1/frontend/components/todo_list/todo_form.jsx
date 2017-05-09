import React from 'react';


class TodoForm {
  constructor(props) {
    super(props);
    this.state =  {
      id: 0, //TODO: fix this.
      title: "",
      body: ""
    };
  }
  newTitle (e) {
    const title = e.target.value;
    this.setState({title});
  }
  newBody (e) {
    const body = e.target.value;
    this.setState({body});
  }
  render() {
    return (
      <div>
        <input onChange={this.newTitle} value={this.state.title}>Title</input>
        <input onChange={this.newBody} value={this.state.body}>Body</input>
      </div>
    );
  }

}
