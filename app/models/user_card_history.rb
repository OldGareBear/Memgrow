class UserCardHistory < ActiveRecord::Base
  belongs_to :user
  belongs_to :card
  
  def refractory_period(times_right_since_last_mistake)
    if times_right_since_last_mistake == 1
      return 1
    else
      return 2 * refractory_period(times_right_since_last_mistake - 1)
    end
  end
  
  def due_at(times_right_since_last_mistake, last_studied)
    last_studied + refractory_period(times_right_since_last_mistake)
  end
  
  def due?(times_right_since_last_mistake, last_studied)
    Time.now > due_at(times_right_since_last_mistake, last_studied)
  end
end
