import {combineReducers} from 'redux';
import todosReducer from './todosReducer.js';

const rootReducer = combineReducers({ //is the state object.
  todos: todosReducer
});

export default rootReducer;
