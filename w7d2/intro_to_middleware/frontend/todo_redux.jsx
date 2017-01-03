import React from 'react';
import ReactDOM from 'react-dom';
import {applyMiddleWare} from 'redux';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  const newStore = applyMiddleWare(store, addLoggingToDispatch);
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

const addLoggingToDispatch = store => next => action => {
  const storeDispatch = store.dispatch;
  console.log(store.getState());
  console.log(action);
  let returnValue = storeDispatch(action);
  console.log(store.getState());
  return returnValue;
};

const applyMiddleWare = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch });
};
