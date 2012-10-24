class Task < ActiveRecord::Base
  belongs_to :list
  belongs_to :user
  
  attr_accessible :name, :due_at, :list_id, :user_id
  validates :name, presence: true
  validates :list, presence: true
  
  scope :complete, where(:completed => true)
  scope :incomplete, where(:completed => false)
  scope :newest_first, order("created_at DESC")
  scope :completed_first, order("completed DESC")
  scope :first_name_first, order("assignment ASC")
  
  def due_date
    if due_at
      "due: #{due_at}"
    else
      nil
    end
  end
end
