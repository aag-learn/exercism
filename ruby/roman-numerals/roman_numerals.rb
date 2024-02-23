class Integer
  def to_roman
    convert(self)
  end

  private

  def convert(decimal)
    case decimal
    in a if a >= 1000 then "M#{convert(a - 1000)}"
    in a if a >= 900 then "CM#{convert(a - 900)}"
    in a if a >= 500 then "D#{convert(a - 500)}"
    in a if a >= 400 then "CD#{convert(a - 400)}"
    in a if a >= 100 then "C#{convert(a - 100)}"
    in a if a >= 90 then "XC#{convert(a - 90)}"
    in a if a >= 50 then "L#{convert(a - 50)}"
    in a if a >= 40 then "XL#{convert(a - 40)}"
    in a if a >= 10 then "X#{convert(a - 10)}"
    in a if a >= 9 then "IX#{convert(a - 9)}"
    in a if a >= 5 then "V#{convert(a - 5)}"
    in a if a >= 4 then "IV#{convert(a - 4)}"
    in a if a >= 1 then "I#{convert(a - 1)}"
    else ''
    end
  end
end
