require 'csv'
require 'minitest/utils'
require 'minitest/autorun'
#2.CSV

class Product

end

class ProductRepository

end

class ProductRepositoryTest < Minitest::Test
  def setup
    FileUtils.rm ProductRepository::FILE rescue all
  end
end
class CsvProj



end