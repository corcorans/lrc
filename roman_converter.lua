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

-- Computes the math for the roman numerals read in
-- @return: returns the computed value.
function final_numeral(roman, roman2, operator)
  if operator == "+" then
    return to_numeral(roman) + to_numeral(roman2)
  else
    return to_numeral(roman) - to_numeral(roman2)
  end
end

-- Reads in the operator that will be performed on the roman numerals
-- @return: returns the operator
function read_operator()
  local operator 
  repeat
    io.write("Enter an operator: ")
    operator = io.read()
  until operator ~= " "
  return operator
end

-- Converts a roman numeral to an integer value
-- @param: a roman numeral
-- @return: returns the numeral value of the roman numeral(s)
function to_numeral(roman_numeral)
    local Integer_Values = { ["M"] = 1000, ["D"] = 500, ["C"] = 100, ["L"] = 50, ["X"] = 10, ["V"] = 5, ["I"] = 1 }
    local numeral = 0    
 
    local counter = 1
    local length = string.len(roman_numeral)
    while counter < length do
        local num1 = Integer_Values[ string.sub(roman_numeral, counter, counter) ]
        local num2 = Integer_Values[ string.sub(roman_numeral, counter+1, counter+1) ]
        
        if num1 < num2 then
            numeral = numeral + ( num2 - num1 )
            counter = counter + 2
        else
            numeral = numeral + num1
            counter = counter + 1    
        end        
    end
 
    if counter <= length then 
      numeral = numeral + Integer_Values[ string.sub(roman_numeral, counter, counter) ] 
    end
 
    return numeral    
end

-- Converts a number to a roman numeral character
-- @return: the roman numeral equivalence of the integer passed in.
function to_roman(number)
  local Roman_Values ={ {1000, "M"}, {500, "D"}, {100, "C"}, {50, "L"}, {10, "X"}, {5, "V"}, {1, "I"} }
  local roman_numeral = " "
  number = math.abs(number)
  
  for i,v in ipairs(Roman_Values) do
    value, roman = unpack(Roman_Values[i])
    while number >= value do
      number = number - value
      roman_numeral = roman_numeral .. tostring(roman)
    end
  end
  return roman_numeral
end

-- Equivalent to a main function
local roman = read_roman()
local operator = read_operator()
local roman2 = read_roman()
local final_num = final_numeral(roman, roman2, operator)
local final_roman = to_roman(tonumber(final_num))

print(" ")
print("Math equivalence: ")
print(roman .. " " .. operator .. " " .. roman2 .. " = " .. final_num)
print(" ")

print("Roman numeral equivalence")

-- Handles the negative sign and when the result is 0.
if final_num < 0 then print("-" .. final_roman)
elseif final_num == 0 then print (0)
else print(final_roman)
end

print("\n")