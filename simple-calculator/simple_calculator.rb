class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)

    [first_operand, second_operand].each {|op| check_operand(op)}
    check_operator(operation)

    result = apply_operator(first_operand, second_operand, operation)
    "#{first_operand} #{operation} #{second_operand} = #{result}"

  rescue ZeroDivisionError
    "Division by zero is not allowed."

  end

private

  def self.check_operator(operator)
    raise UnsupportedOperation if !ALLOWED_OPERATIONS.include?(operator)
  end

  def self.check_operand(operand)
    raise ArgumentError if !operand.is_a?(Numeric)
  end

  def self.apply_operator(first, second, operator)
    case operator
    when "+"
      first + second
    when "/"
      first / second
    when "*"
      first * second
    end
  end

end
