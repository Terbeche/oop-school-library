require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    if @nameable.correct_name.length > 10
      new_name = @nameable.correct_name
      new_name.slice!(10, new_name.length)
      new_name
    else
      @nameable.correct_name
    end
  end
end
