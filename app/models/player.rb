class Player < ActiveRecord::Base

  def presentation_name
    self.nickname || self.name
  end

end
