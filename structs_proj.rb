require 'ostruct'
require 'benchmark'

COUNT = 10_000
NAME = "Test Name"
EMAIL = "test@example.org"

class People
  attr_accessor :name, :email
end

Benchmark.bm(13) do |x|
  x.report("hash: ") do
    COUNT.times do
      p = {name: NAME, email:EMAIL}
    end
  end

  x.report("openstruct: ") do
    COUNT.times do
      p = OpenStruct.new
      #p = OpenStruct.new(:name, :email)  Incorrect!
      #p = p.new(NAME, EMAIL)
      p.name=NAME
      p.email=EMAIL
    end
  end

  x.report("extendstruct: ") do
    extendstruct = Struct.new(:name, :email)
    COUNT.times do
      p = extendstruct.new
      #p = extendstruct.new(NAME, EMAIL)
      p.name=NAME
      p.email=EMAIL
      #p.gender="M" incorrect.
    end
  end

  x.report("class: ") do
    COUNT.times do
      p = People.new
      p.name = NAME
      p.email = EMAIL
    end
  end
end