require 'bcrypt'
require 'dm-validations'

class User
  include BCrypt
  include DataMapper::Resource

  property :id,             Serial
  property :email,          Text
  property :password_hash,  Text
  attr_reader :password
  attr_accessor :password_again

  validates_confirmation_of :password, confirm: :password_again

  @@count = 0

  def initialize params
    self.password = params[:password]
    self.email = params[:email]
    self.password_again = params[:password_again]
    self.save
    @@count += 1
  end

  def password=(password)
    @password = password
    @password_hash = Password.create(password)
  end

  def count
    @@count
  end

end
