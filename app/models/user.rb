require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource

  property :id,             Serial
  property :email,          Text
  property :password_hash,  Text

  @@count = 0

  def initialize params
    self.password = params[:password]
    self.email = params[:email]
    self.save
    @@count += 1
  end

  def password=(password)
    @password_hash = Password.create(password)
  end

  def count
    @@count
  end
end
