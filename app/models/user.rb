class User < ActiveRecord::Base
  # Remember to create a migration!
  validates_format_of :email, with: /.+@.+\..+/
  validates :email, uniqueness: true
  validates :password, :email, presence: true
  validates :password,  length: {minimum: 2}

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user.password == password
      user
    else
      nil
    end
  end
end
