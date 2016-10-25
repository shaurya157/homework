import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';


const preloadedState = {
  notes: [],
  tracks: {},
  isRecording:false,
  isPlaying:false
};

// const addLoggingToDispatch = store => {
//   let dispatch = store.dispatch;
//   return next => action => {
//     console.log(store.getState());
//     console.log(action);
//     let result = next(action);
//     console.log(store.getState());
//     return result;
//   };
// };

const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  let result = store.dispatch(action);
  console.log(store.getState());
  return result;
};


const configureStore = (state = preloadedState) => (
  createStore(
    rootReducer,
    state,
    applyMiddleware(addLoggingToDispatch)
  )
);

export default configureStore;
