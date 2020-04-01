#write your code here
def add(a, b)
    a + b
end

def subtract(a, b)
    a - b
end

def sum(array)
    array.sum()
end

def multiply(*args)
    args.reduce(:*)
end

def power(a, b)
    a**b
end

def factorial(n)
    if n==0
        1
    else
        n*factorial(n-1)
    end
end