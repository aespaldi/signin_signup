class User < ActiveRecord::Base
  validates :name, length: {in: 1..50, message: ">> must be between 2 and 18 chars"}
  validates :password, length: { in: 1..50, message: " >>must be between 5 and 18 characters." }
  validates :email, format: {with: /.{3,}@.{3,20}\..{2,3}/, message: " >> must be xxx@xxx.xxx !"}
  
  def self.authenticate(email, password)
    user = User.find_by_email(email) 
    if user.nil?
      nil
    else
      user.password == password ? user : nil
    end
  end

end
