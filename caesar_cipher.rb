def caesar_cipher(string, shift)

  output = ""
  shift = new_shift(shift) if shift > 26
  shift = new_shift_neg(shift) if shift < -26

    i = 0
    length = string.length
    while i < length
      if is_lower?(string[i, 1])
        code = string[i, 1].ord
        code += shift
        code = 96 + (code - 122) if (code > 122)
        code = 123 - (97 - code) if (code < 97)
        new_character = code.chr
        output += new_character
      elsif is_upper?(string[i,1])
        code = string[i, 1].ord
        code += shift
        code = 64 + (code - 90) if (code > 90)
        code = 91 - (65 - code) if (code < 65)
        new_character = code.chr
        output += new_character
      else
        output += string[i, 1]
      end

      i += 1
    end

    output
end

def new_shift(shift)
  until shift < 27 
    shift -= 26
  end
  return shift
end

def new_shift_neg(shift)
  until shift > -27 
    shift += 26
  end
  return shift
end

def is_lower?(character)
  character >= 'a' && character <= 'z'
end

def is_upper?(character)
  character >= 'A' && character <= 'Z'
end
