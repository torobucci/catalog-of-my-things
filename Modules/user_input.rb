module UserInput
  def user_input(messages)
    inputs = []
    messages.each do |msg|
      print "#{msg}: "
      inputs.push(gets.chomp)
    end
    inputs.length == 1 ? inputs.first : inputs
  end
end
