import React from 'react';
import TodoListItem from './todo_list_item';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
  }

  render() {
    return (
      <ul>
        {this.props.todos.map( (todo, idx) => {
          return (<TodoListItem key={idx} todo={todo} />);
        })}
      </ul>
    );
  }
}

export default TodoList;
