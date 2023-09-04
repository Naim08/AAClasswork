import logo from "./logo.svg";
import "./App.css";

import Form from "./components/Form";

function App() {
  const submitForm = (values) => {
    console.log(values);
  };
  return (
    <div className="App">
      <Form submitForm={submitForm} />
    </div>
  );
}

export default App;
