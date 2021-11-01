class SimpleCalculator

  class UnsupportedOperation < Exception
  end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError unless first_operand.is_a?(Numeric) && second_operand.is_a?(Numeric)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include? operation

    begin
      result = first_operand.send(operation, second_operand)
      "#{first_operand} #{operation} #{second_operand} = #{result.to_s}"  
    rescue ZeroDivisionError => e
      "Division by zero is not allowed."
    end
  end
end
