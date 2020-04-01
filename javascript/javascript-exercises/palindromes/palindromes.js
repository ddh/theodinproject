const palindromes = function(str) {
    str = str.replace(/[^a-zA-Z]/g, '').toLowerCase();
    var newStr = str.replace(/[^a-zA-Z]/g, '').split('').reverse().join('');
    return (str == newStr) ? true : false;

}

module.exports = palindromes
