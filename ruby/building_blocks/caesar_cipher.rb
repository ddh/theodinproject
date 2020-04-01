def caesar_cipher(str, n)
  result = ""
  if n > 26
    n = n / 26
  end
  str.split("").each { |letter|
    if letter.match(/[^a-zA-Z]/)
      ascii_letter = letter
    else
      if letter === letter.downcase
        if letter.ord + n > 122
          ascii_letter = letter.ord + n - 26
        else
          ascii_letter = letter.ord + n
        end
      elsif letter === letter.upcase
        if letter.ord + n > 90
          ascii_letter = letter.ord + n - 26
        else
          ascii_letter = letter.ord + n
        end
      end
      ascii_letter = ascii_letter.chr
    end
    result = result + ascii_letter
  }
  puts result
end

caesar_cipher("What a string!", 27)
