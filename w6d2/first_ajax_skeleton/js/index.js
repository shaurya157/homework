console.log("Hello from the JavaScript console!");

$.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log('We have your weather!');
    console.log(data);
  },
  error(){
    console.log('An error has occured');
  }
});

console.log('hello from outside the js console!');
