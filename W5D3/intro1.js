function madlib(verb, adjective, string) {
  console.log("We Shall ${verb.toUpperCase} the ${adjective.toUpperCase} ${adjective.toUpperCase}") ;
}

madlib("hit", "harry", "hippo") ;


function isSubstring(searchString, subString) {

  searchString.includes(subString) ;
}


function fizzBuzz(arr) {
  const finalArray = [] ;

  arr.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      finalArray.push(el);
    }
  });
}

function isPrime(n) {
  if (n < 2) { return false ; }

  for (let i = 2; i < n; i ++ ) {
    if (n % i === 0 ) {
      return false ;
    }
  }
  return true ;
}


function sumOfNPrimes(n) {
  let sum = 0 ;
  let counter = 2 ;
  let countPrimes = 0 ;

  while (countPrimes < n ) {
    if ( isPrime(counter)) {
      sum += counter ;
      countPrimes ++ ;
    }
    counter ++ ;
  }
  return sum ;
}

function allOrNothing(mod, ...numbers) {
  numbers.forEach(el => {
    if (el % mod !== 0) {
      return false ;
    }
  });
  return true ;
}
