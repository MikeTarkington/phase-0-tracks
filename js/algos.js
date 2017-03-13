// RELEASE 0

// Add a file called algos.js to the phase-0-tracks/js folder.
// In algos.js, write a function that takes an array of words or phrases and returns the longest word or phrase in the array. So if we gave your function the array of ["long phrase","longest phrase","longer phrase"], it would return "longest phrase". This is a logical reasoning challenge, so try to reason through this based on what you already know, rather than Googling the fanciest solution or looking up built-in sorting functions. Note that "some string".length will do what you expect in JS.
// Add driver code that tests your function on a few arrays.


//function taking array of words
//return longest word or phrase in the array

var longest_string_getter = function(array) {
  longest_string = " ";
  for (count = 0; count < array.length; count++){
    if (array[count].length > longest_string.length) {
      longest_string = array[count]
    }
  }
  return "The longest string was: " + longest_string;
};

console.log(longest_string_getter(["test one","test", "testing success", "farts"]));

//RELEASE 1

//In algos.js, write a function that takes two objects and checks to see if the objects share at least one key-value pair. (You'll keep adding to this file, so we suggest grouping functions at the top and testing at the bottom of the file.) If we called your function with {name: "Steven", age: 54} and {name: "Tamir", age: 54}, the function would return true, because at least one key-value pair matches between the two objects. If no pairs match (and keep in mind that the two objects may not even have any of the same keys), the function should return false. To make your life easier, don't worry about whether a property is a string ('age') or an identifier name (age). Those can be considered equivalent. Again, try to reason through the problem using the basics you've already learned, rather than looking up slick search functions that will do the job for you. We'd rather see you write code that you actually understand!
// Add some driver code that tests both outcomes of your function.

//function takes two objects
//checks for shared key-value pairs
//return true or false depending on whether or not match is found

// var pairMatchFinder = function(pair1, pair2) {
//   var match = false;
//   for(name in pair1) {
//       if(data.hasOwnProperty(key)) {
//           var value = data[key];
//           //do something with value;
//       }
//   }

var pairMatchFinder = function(pair1, pair2) {
  var match = false;
  for (count = 0; count < Object.keys(pair1).length; count++) {
    if (pair1['name'] === pair2['name'] || pair1['age'] === pair2['age']) {
      var match = true;
    }
  }
  return match;
};

console.log(pairMatchFinder({name: "Steven", age: 54}, {name: "Tamir", age: 54})) //age match
console.log(pairMatchFinder({name: "Steven", age: 54}, {name: "Tamir", age: 40})) //no match
console.log(pairMatchFinder({name: "Tamir", age: 54}, {name: "Tamir", age: 54})) // name and age match
console.log(pairMatchFinder({name: "Steven", age: 54}, {name: "Steven", age: 40})) // name match

//RELEASE 2

// Write a function that takes an integer for length, and builds and returns an array of strings of the given length. So if we ran your function with an argument of 3, we would get an array of 3 random words back (the words don't have to be actual sensical English words -- "nnnnfph" totally counts). The words should be of randomly varying length, with a minimum of 1 letter and a maximum of 10 letters. (This involves a new trick, generating a random number, that you'll have to look up, but the solution on how to do so is relatively straightforward.)
// Add driver code that does the following 10 times: generates an array, prints the array, feeds the array to your "longest word" function, and prints the result.


//--PSEUDO CODE--
//define function taking intenger
//returns array of strings with the number of strings based on the number
  //Math.floor rounds down to the nearest whole number but since there's a +1 it means the lowest whole number .floor would round down to is 1
  //Math.random is generating random float numbers so multiplying by 10 brings an ingeter to the left of the decimal point which then gives us a whole number we can round down to with the .floor
//random word length looping until the count of the randm number has been generated

var arrayer = function(x) {
  alpha = "abcdefghijklmnopqrstuvwxyz";
  string = "";
  array = [];
  for( i = 0; i < x; i++) {
    for( count = 0; count < Math.floor((Math.random() * 10) + 1); count++) {
      // string += alpha.charAt(Math.floor(Math.random() * alpha.length) + 1);
      string = Math.random().toString(36).substr(2, Math.floor((Math.random() * 10) + 1));
    }
    array.push(string)
  }
  return array
}

//--DRIVER CODE--

array = []
for( i = 0; i < 10; i++) {
  console.log(array = arrayer(Math.floor((Math.random() * 10) + 1)));
  console.log(longest_string_getter(array));
}

// function makeid()
// {
//     var text = "";
//     var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
//
//     for( var i=0; i < 5; i++ )
//         text += possible.charAt(Math.floor(Math.random() * possible.length));
//
//     return text;
// }
