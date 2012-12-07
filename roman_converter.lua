-- Read in the roman numerals from input
-- @return: returns the roman numeral read in
function read_roman() 
  local roman_numeral
    repeat
      io.write("Please enter a roman numeral: ")
      roman_numeral = io.read()
    until roman_numeral ~= " "
  return roman_numeral
end

-- Converts a roman numeral to an integer value
-- @param: a roman numeral
-- @return: returns the numeral value of the roman numeral(s)
function to_numeral(roman_numeral)
    local Roman_Values = { ["M"] = 1000, ["D"] = 500, ["C"] = 100, ["L"] = 50, ["X"] = 10, ["V"] = 5, ["I"] = 1 }
    local numeral = 0    
 
    local counter = 1
    local length = string.len(roman_numeral)
    while counter < length do
        local num1 = Roman_Values[ string.sub(roman_numeral, counter, counter) ]
        local num2 = Roman_Values[ string.sub(roman_numeral, counter+1, counter+1) ]
        
        if num1 < num2 then
            numeral = numeral + ( num2 - num1 )
            counter = counter + 2
        else
            numeral = numeral + num1
            counter = counter + 1    
        end        
    end
 
    if counter <= length then 
      numeral = numeral + Roman_Values[ string.sub(roman_numeral, counter, counter) ] 
    end
 
    return numeral    
end

local roman = read_roman()
print("Roman Numeral: " .. roman)
print("Value: " .. to_numeral(roman))