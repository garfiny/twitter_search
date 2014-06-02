class Progress < ActiveRecord::Base

  scope :in_progress, -> { where(status: 'running') } 

  def running?
    self.status == 'running'
  end

  def done?
    self.status == 'done'
  end
end
