import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = { num1: "", num2: "", result: 0 };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e) {
    this.setState({num1: e.target.value});
  }

  setNum2(e) {
    this.setState({num2: e.target.value});
  }

  add(e) {
    e.preventDefault();
    let result = parseInt(this.state.num1) + parseInt(this.state.num2);
    this.setState({ result });
  }

  subtract(e) {
    e.preventDefault();
    let result = parseInt(this.state.num1) - parseInt(this.state.num2);
    this.setState({ result });
  }

  multiply(e) {
    e.preventDefault();
    let result = parseInt(this.state.num1) * parseInt(this.state.num2);
    this.setState({ result });
  }

  divide(e) {
    e.preventDefault();
    let result = parseInt(this.state.num1) / parseInt(this.state.num2);
    this.setState({ result });
  }

  clear(e) {
    e.preventDefault();
    this.setState({ num1: "", num2: "", result: 0 });
  }

  render() {
    const { num1, num2, result } = this.state;
    return (
      <div>
        <h1>{result}</h1>
        <input type="text"
          value={num1}
          onChange={this.setNum1}>
        </input>
        <input type="text"
          value={num2}
          onChange={this.setNum2}>
        </input>
        <button onClick={this.clear}>Clear</button>
        <br/>
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.divide}>/</button>
        <button onClick={this.multiply}>*</button>
      </div>
    );
  }
}

export default Calculator;
