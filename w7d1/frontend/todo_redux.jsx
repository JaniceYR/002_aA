import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import selectors from './reducers/selectors.js';
// import App from './components/app';
import Root from './components/root';

const store = configureStore();
window.store = store;

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store} />, root);
});
