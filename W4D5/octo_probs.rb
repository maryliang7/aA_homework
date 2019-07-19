def sluggish_octopus(array)
    longest = ""
    array.each do |fish|
        array.each do |fish1|
            if fish.length > fish1.length && fish.length > longest.length
                longest = fish
            end
        end
    end
    longest
end

def dom_octo(array)
    current = array[0]
    words = array
    until words.empty?
        words = array.drop(1).select { |word| word.length > current.length }
        current = words[0]
    end
    current
end

def clever_octo(array)
    longest = array[0]
    array.each do |fish|
        if fish.length > longest.length
            longest = fish
        end
    end
    longest
end

def slow_dance(str, tiles_arr)
    tiles_arr.each_with_index do |dir, idx|
        return idx if dir == str
    end
end

def const_dance(str, tiles_hash)
    tiles_hash[str]
end
