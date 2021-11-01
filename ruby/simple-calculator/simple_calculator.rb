class SimpleCalculator

  class UnsupportedOperation < Exception
  end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError unless first_operand.is_a?(Numeric) && second_operand.is_a?(Numeric)
    case operation
    when '+' then self.format(first_operand, second_operand, operation, first_operand + second_operand)
    when '-' then self.format(first_operand, second_operand, operation, first_operand - second_operand)
    when '*' then self.format(first_operand, second_operand, operation, first_operand * second_operand)
    when '/' then 
      if second_operand == 0
        "Division by zero is not allowed."
      else
        self.format(first_operand, second_operand, operation, first_operand / second_operand)
      end
    else raise UnsupportedOperation.new
    end
  end

  private 

  def self.format first_operand, second_operand, operation, result
    "#{first_operand.to_s} #{operation.to_s} #{second_operand.to_s} = #{result.to_s}"
  end
end
