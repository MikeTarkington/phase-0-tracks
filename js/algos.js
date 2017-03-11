// Add a file called algos.js to the phase-0-tracks/js folder.
// In algos.js, write a function that takes an array of words or phrases and returns the longest word or phrase in the array. So if we gave your function the array of ["long phrase","longest phrase","longer phrase"], it would return "longest phrase". This is a logical reasoning challenge, so try to reason through this based on what you already know, rather than Googling the fanciest solution or looking up built-in sorting functions. Note that "some string".length will do what you expect in JS.
// Add driver code that tests your function on a few arrays.


//function taking array of words
//return longest word or phrase in the array

var longest_string_getter = function(array) {
  longest_string = " "
  for (count = 0; count < array.length; count++){
    if (array[count].length > longest_string.length) {
      longest_string = array[count]
    }
  }
  return longest_string
};

console.log(longest_string_getter(["test one","test", "testing success", "farts"]));
