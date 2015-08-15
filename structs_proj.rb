require 'ostruct'
require 'benchmark'

COUNT = 1_000_000
NAME = "Test Name"
EMAIL = "test@example.org"

class Person
  attr_accessor :name, :email
end

Benchmark.b