class Url < ActiveRecord::Base
  

  validates :short, uniqueness: true
  validates :long, presence: true, length: {minimum: 3}, length: {maximum: 200}

  before_create :create_short

def create_short
  self.short = SecureRandom.hex(6)
    while self.invalid?
      self.short = SecureRandom.hex(6)
    end
end


end
