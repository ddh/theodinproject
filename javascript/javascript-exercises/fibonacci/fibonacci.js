const fibonacci = function(n) {
    const fibSeq = [1, 1];
    if (n < 0) return "OOPS";
    for (let i=2; i < n; i++){
        fibSeq.push(fibSeq[i - 1] + fibSeq[i - 2]);
    }   
    return fibSeq[n - 1];
}

module.exports = fibonacci
