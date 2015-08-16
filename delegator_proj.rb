require 'delegate'

class Per
  attr_accessor :name, :email
end


class Decorate < SimpleDelegator
  def sub(str)
    str.gsub /\W/,'-'  #Note gsub syntax, no parentheses
  end
end

sample = Per.new
sample.name ="A B"
dec = Decorate.new(sample)
puts dec.sub(sample.name)

