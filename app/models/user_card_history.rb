class UserCardHistory < ActiveRecord::Base
  belongs_to :user
  belongs_to :card
  
  def refractory_period(straight_successes)
    if straight_successes == 0
      return 10.minutes
    elsif straight_successes == 1
      return 1.day
    else
      puts times_right_since_last_mistake
      return 2 * refractory_period(straight_successes - 1)
    end
  end
  
  def due_at
    self.last_studied + refractory_period(self.times_right_since_last_mistake)
  end
  
  def due?
    Time.now > due_at
  end
end
