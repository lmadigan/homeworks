  //
  // window.setTimeout(function() {
  //   alert('HAMMERTIME'); } , 5000) ;


// function hammerTime(time){
//     window.setTimeout(function() {
//       alert(`${time} is hammerTime!`); } , time) ;
// }
// hammerTime(5000);

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output:process.stdout
});

function teamBiscuits() {
  reader.question("Would you like some tea?", function (tea) {
    reader.question("biscuits?", function (biscuits) {
      console.log(`${tea} ${biscuits}`);
      reader.close();
    });
  });
}
