def translate(text)
    vowels = ["a", "e", "i", "o", "u", "y"]
    phoneme = ["qu"]
    text.gsub(/\w+/) do |word|
        if vowels.include?(word[0])
            word.scan(/./).join + 'ay'
        else 
            i = 0
            while vowels.include?(word[i]) == false
                if word[i] == "q" && word[i+1] == "u"
                    i = i+1
                end
                i += 1;
            end
            word.scan(/./).rotate(i).join + 'ay'
        end
    end
end