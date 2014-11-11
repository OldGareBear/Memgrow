class UserCardHistory < ActiveRecord::Base
  belongs_to :user
  belongs_to :card
  
  def refractory_period(times_right_since_last_mistake)
    if times_right_since_last_mistake == 1
      return 1.day
    else
      return 2 * refractory_period(times_right_since_last_mistake - 1)
    end
  end
  
  def due_at
    self.last_studied + refractory_period(self.times_right_since_last_mistake)
  end
  
  def due?
    Time.now > due_at
  end
end
