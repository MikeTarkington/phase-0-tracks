
var horse_color = ['white', 'red', 'black', 'grey'];
var horse_name = ['Conquest', 'War', 'Famine', 'Death'];

/*
for (var i = 0; i < horse_name.length; i++) {
    console.log(horse_name[i]);
}
*/
horse_color.push('chestnut');
horse_name.push('Epona');
// console.log(horse_color);
// console.log(horse_name);
var horsey = {Conquest: horse_color[0],
    War: horse_color[1],
    Pestilence: horse_color[2],
    Death: horse_color[3],
    Epona: horse_color[4],
}
console.log(horsey)

// -----------------------------

function Car(make, year, nitrous) {
	this.make = make;
	this.year = year;
  this.nitrous = nitrous;

//creating rev function which equivalent to a instance method
	this.rev = function() { console.log("VROOM VROOM!"); };

	console.log("CAR INITIALIZATION COMPLETE");
}


//constructor call
console.log("Let's build a car ...");
var car1 = new Car("Lambo", 2017, true);
console.log(car1);
console.log("Our car can rev:");
car1.rev();
console.log("----");

console.log("Let's build a car ...");
var car2 = new Car("NightRider", 1982, true);
console.log(car2);
console.log("Our car can rev:");
car1.rev();
console.log("----");

console.log("Let's build a car ...");
var car3 = new Car("Mystery Machine", 1977, false);
console.log(car3);
console.log("Our car can rev:");
car1.rev();
console.log("----");
