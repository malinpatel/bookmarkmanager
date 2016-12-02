require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  has n, :links, through: Resource

  property :id, Serial
  property :email, String
  property :password, Text

  @@count = 0

  def count
    @@count
  end

  def increment
    @@count += 1
  end

end
