// following guide from: // http://learn.jquery.com/about-jquery/how-jquery-works/

// $ is the shorthand for jquery which is written at the start of a jquery statement to access its methods and properties

// standard js for performing js on page load
// window.onload = function() {
//
//     alert( "welcome" );
//
// };
// jquery ready event that runs script sooner than standard because standard needs to finish loading images
$( document ).ready(function() {
    console.log("plebs")

    // adding a click handler to an event
    $( document ).ready(function() {
      $( "a" ).click(function( event ) {
        alert( "Thanks for visiting!" );
      });
    });

    // preventing default behavior of a link(or element)
    $( document ).ready(function() {

    $( "a" ).click(function( event ) {
        alert( "As you can see, the link no longer took you to jquery.com" );
        event.preventDefault();

    });

    // adding a class via jquery to all <a> elements
    $( "a" ).addClass( "test" );


    // a click event that will slowly hide the element creating an aimated effect
    $( "a" ).click(function( event ) {
        event.preventDefault();
        $( this ).hide( "slow" );
    });

});

});
