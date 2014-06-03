class Progress < ActiveRecord::Base

  def self.in_progress
    Progress.last
  end

  def running?
    self.status == 'running'
  end

  def done?
    self.status == 'done'
  end
end
