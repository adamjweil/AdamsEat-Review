class App extends React.Component {
  constructor() {
    super();
    this.state = {
      restaurants: [],
      newRestaurant: {}
    };
  }

  componentDidMount() {
    fetch('http://localhost:3000/restaurants')
    .then(function(response){
      return response.json();
    })
    .then((obj) => {
      console.log(obj)
      this.setState({restaurants: obj})
    });
  }

  render() {
    return(
      <div id="container">
        <RestaurantList
          restaurants={this.state.restaurants} />
      </div>
    )
  }
}
