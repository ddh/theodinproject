#write your code here
def echo(str)
    str
end

def shout(str)
    str.upcase
end

def repeat(*args)
    if args[1] == nil
        args = args * 2
        args.join(' ')
    else
        args = (args[0] + " ") * args[1]
        args.split(" ")
        len = args.length - 1
        args[len] = ""
        args
        
    end
end

def start_of_word(str, n)
    str.split("")
    str[0, n]
end

def first_word(str)
    str = str.split(' ')
    str[0]
end

def titleize(str)
    str[0] = str[0].upcase
    small_words = %w[a aboard about above across after against along amid among an and anti around as at before behind below beneath beside besides between beyond but by concerning considering despite down during except excepting excluding following for from in inside into like minus near nor of off on onto opposite or outside over past per plus regarding round save since than the through to toward towards under underneath unlike until up upon versus via with within without]
    str_array = str.split(' ')
    if str_array.length > 1
        str_array.each do |str|
            if small_words.include?(str)
                str
            else
                str[0] = str[0].upcase
            end
        end
    end
    str = str_array.join(" ")
end

