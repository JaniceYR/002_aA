import {connect} from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import {receiveTodo} from '../../actions/todo_actions';

const mapStateToProps = (state) => {
  return ({
    todos: allTodos(state) //this.props.todos
  });
};

const mapDispatchToProps = (dispatch) => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo))
  //this.props.receiveTodo(todo) =>
  //store.dispatch()
/*
  function receiveTodo(todo) {
    dispatch(todoAction);
  }
  'this.props.receiveTodo(todo)'
*/
});
export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
//onclick call this.props.receiveTodo(todo)
//todolist has the props from above.
