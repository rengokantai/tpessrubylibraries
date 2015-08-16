require 'forwardable'


class Pers
  extend Forwardable

  def_delegator  :@address, :to_s, :full_address # Person.full_addres -> @address.to_s
  def_delegators :@address, :city, :country   # Keep as origin, no direction

  attr_reader :name, :address
  def initialize name:, address: Address.new
    @name = name
    @address = address
  end
end

class Address
  attr_reader :street, :zipcode, :city, :country
  def initialize street:, zipcode:, city:, country:
      @street = street
    @zipcode = zipcode
    @city = city
    @country = country
  end

  def to_s
    <<EOF
#{street}
    #{zipcode} #{city}
    #{country}
EOF
  end
end

person = Pers.new(
    name: "K",
    address: Address.new(
        street: "A",
        zipcode: 12345,
        city: "TJ",
        country: "China"))

puts person.city
puts person.country
puts person.full_address
