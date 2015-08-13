require "minitest/autorun"
require_relative "person"
#1. Minitest


class MiniTestProj < Minitest::Test
  def test_asserts_the_truth
    assert true, "Optional message"
  end

  def test_person_has_a_name
    person = Person.new "x"
    assert_equal person.name, "x"
  end
end