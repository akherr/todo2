class User < ActiveRecord::Base
  has_many :tasks
  attr_accessible :email, :first_name, :middle_name, :last_name
  validates :email, presence: true
  validates :first_name, presence:true
  
  def set_logged_in
    self.update_attribute(:last_login, Time.now)
  end
  def to_s
    full_name
  end
  def full_name
    [first_name, middle_name, last_name].compact.join(" ")
  end
end
