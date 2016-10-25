import React from 'react';
import ReactDOM from 'react-dom';

import Note from './util/note.js';

import configureStore from './store/store';
import Root from './components/root';


// const addLoggingToDispatch = store => {
//   let dispatch = store.dispatch;
//   return next => action => {
//     console.log(store.getState());
//     console.log(action);
//     dispatch(action);
//     console.log(store.getState());
//   };
// };

// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach(middleware => {
//     dispatch = middleware(store)(dispatch);
//   });
//
//   return Object.assign({}, store, { dispatch });
// };

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  // const newStore = applyMiddlewares(store, addLoggingToDispatch);
  ReactDOM.render(<Root store={store} />, rootEl);
});
