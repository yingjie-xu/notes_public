# React.js

### Why react?
- virtual DOM --> fast
- Reusable Web Components

---

## ReactDOM and JSX
```javascript
import React from "react"
import ReactDOM from "react-dom"

ReactDOM.render(WHAT DO I WANT TO RENDER, WHERE DO I WANT TO RENDER IT)
// JSX
ReactDOM.render(<div><h1>Hello world!</h1><p>This is a paragraph</p></div>, document.getElementById("root"))
```
> import React so that we could use JSX in our code.

> ***IMPORTANT: Adjacent JSX elements must be wrapped in an enclosing tag (`<div>`)***

---

## Functional Components
```javascript
import React from "react"
import ReactDOM from "react-dom"

function MyApp() {
  return (
    <div>
      <h1>Bob Ziroll</h1>
      <p>This is a paragraph about me...</p>
      <ul>
        <li>Thailand</li>
        <li>Japan</li>
        <li>Nordic Countries</li>
      </ul>
    </div>
  )
}

ReactDOM.render(
  <MyApp />,
  document.getElementById("root")
)
```

> the naming convention is use the canmel case and capitalize the first character

> wrap JSX in a container 

---

- good convention to keep each file have one component 
```javascript
// MyInfo.js
import React from "react"

function MyApp() {
  return (
    <div>
      <h1>Bob Ziroll</h1>
      <p>This is a paragraph about me...</p>
      <ul>
        <li>Thailand</li>
        <li>Japan</li>
        <li>Nordic Countries</li>
      </ul>
    </div>
  )
}

export default MyInfo
```
```javascript
// index.js
import React from "react"
import ReactDOM from "react-dom"
import MyInfo from "./components/MyInfo"

ReactDOM.render(
  <MyApp />,
  document.getElementById("root")
)
```

> provide a path for `./components/MyInfo.js`, we can omit `.js` here

- `<App />` component 
- `<div>...</div>` element

---

```javascript
import React from "react"
import ReactDOM from "react-dom"

import App from "./App"

ReactDOM.render(<App />, document.getElementById("root"))
```
```javascript
import React from "react"
import Footer from "./Footer"

function App() {
    return (
        <div>
            <Main />
            <Footer />
        </div>
    )
}

export default App
```
```javascript
import React from "react"

function Footer() {
    return (
        <footer>
            <h3>This is my footer element</h3>
        </footer>
    )
}

export default Footer
```

`<header className="navbar">This is the header</header>`
> For the JSX the original `class` keyword in html is changed to `className`.

---

## Put javascript inside the JSX
> By wrapping the javascript inside the `{}`, we could use javascript inside JSX
```javascript
import React from "react"
import ReactDOM from "react-dom"

function App() {
  const firstName = "Bob"
  const lastName = "Ziroll"
  
  return (
    <h1>Hello {firstName + " " + lastName}!</h1>
  )
}

ReactDOM.render(<App />, document.getElementById("root"))
```

- `<h1 style="color: #FF8C00">Good {timeOfDay}!</h1>` will be an error in JSX
- we need an object, one set of `{}` for the javascript syntax, the second pair of the `{}` is used to indicate the object: `<h1 style={{color: "#FF8C00"}}>Good {timeOfDay}!</h1>`
- further: use canmel case in javascript. From `background-color` to `backgroundColor`
- put the value into a string 

```javascript
const styles = {
  color: "#FF8C00", 
  backgroundColor: "#FF2D00",
  fontSize: "200px"
}
  
return (
  <h1 style={styles}>Good {timeOfDay}!</h1>
)
```

- we can use javascript to generate the style dynamically.

---

## React Props

```javascript
// Joke
import React from "react"

function Joke(props) {
    return (
        <div>
            <h3 style={{display: !props.question && "none"}}>Question: {props.question}</h3>
            <h3 style={{color: !props.question && "#888888"}}>Answer: {props.punchLine}</h3>
            <hr/>
        </div>
    )
}

export default Joke

// create Joke in another file by 
<Joke 
  question="What's the best thing about Switzerland?" 
  punchLine="I don't know, but the flag is a big plus!"
/>
```


```javascript
import React from "react"

import Joke from "./Joke"
import jokesData from "./jokesData"

// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findindex

function App() {
    const jokeComponents = jokesData.map(joke => <Joke key={joke.id} question={joke.question} punchLine={joke.punchLine} />)
    
    return (
        <div>
            {jokeComponents}            
        </div>
    )
}

export default App
```
> Notice how to use the `map` method here!
---
## Class-based Components

```javascript
import React from "react"

// function based components
function App(props) {
    return (
        <div>
            <h1>{props.whatever}</h1>
        </div>
    )
}

// class-based components
class App extends React.Component {
    
    yourMethodHere() {
        
    }
    
    render() {
        return (
            <div>
                <h1>{this.props.whatever}</h1>
            </div>
        )
    }
}

export default App
```
> instead of writing `class App extends React.Component`. we could import `import React, {Component} from "react"` and `class App extends Component`.

---

## State

- In react, props are immutable --> we couldn't change the props.
- Need class-based components to have the `State`

```javascript
import React from "react"

// https://scrimba.com/p/p4Mrt9/cQnMDHD

class App extends React.Component {
    constructor() {
        // always keep super()
        super()
        this.state = {
            answer: "Yes"
        }
    }
    
    render() {
        return (
            <div>
                <h1>Is state important to know? {this.state.answer}</h1>
                <ChildComponent answer={this.state.answer}/>
            </div>
        )
    }
}

export default App
```


- the event handler should have a function as input (either create a new function in the class OR use the arrow function)

---
- To change the state, we shouldn't directly change the state, we should use the `this.setState` method 
  - pass in an object `this.setState({ count : 1 })` if we don't care about the previous state
  - Gererally, we should pass in a function to `this.setState()`
    - The function has an input of `prevState`, and should return the new state. (arrow function here)
    - 

### Binding Event Handlers 
`this.handleClick = this.handleClick.bind(this)` in the constructor is the best way to bind the handlers to the object.

```javascript
// correct way to setState from the doc
this.setState((state, props) => {
  return {counter: state.counter + props.step};
});
```

```javascript
import React from "react"

class App extends React.Component {
    constructor() {
        super()
        this.state = {
            count: 0
        }
        // bind the handler in the constructor
        this.handleClick = this.handleClick.bind(this)
    }
    
    handleClick() {
      // setState should have prevState as input
        this.setState(prevState => {
            return {
                //return the new state
                count: prevState.count + 1
            }
        })
    }
    
    render() {
        return (
            <div>
                <h1>{this.state.count}</h1>
                <button onClick={this.handleClick}>Change!</button>
            </div>
        )
    }
}

export default App
```
- We can pass the state into the children's component, and anytime the state changes, React will render the component again. 

 --- 

## Lifecycle
- `render()` is actually a lifecycle method
- `componentDidMount()` is like "you were just borned" --> component just showed on the screen. (rerender doesn't call this method)
  - one example is make API call (get information from some database) at beginning
- `componentDidUpdate(prevProps, prevState)` --> only set state under certain conditions, otherwise might have infinite loop
- `componentWillReveiveProps(nextProps)` runs everytime when the parent component decides to give props to the child component. (method in the child component) --> **is not a part of react anymore**
  - check if the new prop is the same or different
- `shouldComponentUpdate(nextProps, nextState)` checks if the component needs to update --> give developer a chance to optimize their code 
  - return `true`: want to update
- `componentWillUnmount()` when the component will disappear from the screen
  - clean up the code before everything disappears
- other ...

```javascript
import React, {Component} from "react"

// https://engineering.musefind.com/react-lifecycle-methods-how-and-when-to-use-them-2111a1b692b1
// https://reactjs.org/blog/2018/03/29/react-v-16-3.html#component-lifecycle-changes

class TodoList extends Component {
    constructor() {
        super()
        this.state = {}
    }
    
    static getDerivedStateFromProps(props, state) {
        // return the new, updated state based upon the props
        // https://reactjs.org/docs/react-component.html#static-getderivedstatefromprops
        // https://reactjs.org/blog/2018/06/07/you-probably-dont-need-derived-state.html
    }
    
    getSnapshotBeforeUpdate() {
        // create a backup of the current way things are
        // https://reactjs.org/docs/react-component.html#getsnapshotbeforeupdate
    }
    
    // componentWillMount() {
        
    // }
    
    componentDidMount() {
        // GET the data I need to correctly display
    }
    
    // componentWillReceiveProps(nextProps) {
    //     if (nextProps.whatever !== this.props.whatever) {
    //         // do something important here
    //     }
    // }
    
    shouldComponentUpdate(nextProps, nextState) {
        // return true if want it to update
        // return false if not
    }
    
    // componentWillUpdate() {
        
    // }
    
    componentWillUnmount() {
        // teardown or cleanup your code before your component disappears
        // (E.g. remove event listeners)
    }
    
    render() {
        return (
            <div>
                Code goes here
            </div>
        )
    }
}

export default App
```

---

## Conditional Rendering
Many ways to do this

- ternary operators `Condition ? TRUE : FALSE`

```javascript
import React from "react"

function Conditional(props) {
    return (
        <div>
            <h1>Navbar</h1>
            
            {props.isLoading ? <h1>Loading...</h1> : <h1>Some cool stuff about conditional rendering</h1>}
            
            <h1>Footer</h1>
        </div>
    )
    
}

export default Conditional
```
- `&&` will evaluate left side first
  - if `true`, return right side 
  - if `false`, return `false `
```javascript
render() {
    return (
        <div>
            {
                this.state.unreadMessages.length > 0 && 
                <h2>You have {this.state.unreadMessages.length} unread messages!</h2>
            }
        </div>
    )
}
```
---
## Fetch Data

```javascript
componentDidMount() {
    this.setState({loading: true})
    fetch("https://swapi.co/api/people/1")
        .then(response => response.json())
        .then(data => {
            this.setState({
                loading: false,
                character: data
            })
        })
}
```


