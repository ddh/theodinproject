const caesar = function (str, n) {
    const alph = "abcdefghijklmnopqrstuvwxyz";
    const alphUpper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    str = str.split('').map(x => {
        if (alphUpper.includes(x)){
            if (endOfArray(alphUpper.indexOf(x) + n)){
                while (n > 26){
                    n -= 26;
                }
                x = alphUpper[alphUpper.indexOf(x) - 26 + n];
                return (x);
            }
            if ((startOfArray(alphUpper.lastIndexOf(x) + n))){
                x = alphUpper[alphUpper.indexOf(x) + 26 + n];
                return (x);
            }
            else {
                x = alphUpper[alphUpper.indexOf(x) + n];
                return (x);
            }
        }
        if (alph.includes(x)) {
            if (endOfArray(alph.indexOf(x) + n)){
                while (n > 26){
                    n -= 26;
                }
                x = alph[alph.indexOf(x) - 26 + n];
                return (x);
            }
            if ((startOfArray(alph.lastIndexOf(x) + n))){
                x = alph[alph.indexOf(x) + 26 + n];
                return (x);
            }
            else {
                x = alph[alph.indexOf(x) + n];
                return (x);
            }
        }
        else {
            return (x);
        }

    });
    function isUpper(char){
        if(char == char.toUpperCase()) {
            return true;
        }
        else return false;
    }
    function endOfArray(nb){
        if (nb >= 26){
            return true;
        }
        else return false;
    }
    function startOfArray(nb){
        if (nb < 0){
            return true;
        }
        else return false;
    }

    return(str.join(''));
}
module.exports = caesar
