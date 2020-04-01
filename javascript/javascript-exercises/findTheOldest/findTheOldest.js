let findTheOldest = function(array) {
    var age = array.map(x => parseInt((typeof x.yearOfDeath === 'undefined') ? 2020 - x.yearOfBirth : x.yearOfDeath - x.yearOfBirth));
    var oldest = Math.max.apply(null, age);
    var person = array[age.indexOf(oldest)];
    return person;
}

module.exports = findTheOldest
