export const allTodos = (state) => {
  let todoIds = Object.keys(state.todos);
  return todoIds.map((id) => {
    return state.todos[id]; //returns all our todos in an array
  });
};

//TODO: delete this after testing
window.allTodos = allTodos;
export default allTodos;
