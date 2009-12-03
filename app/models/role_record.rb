class RoleRecord < ActiveRecord::Base
  self.abstract_class = true

  include GrabName
  include Watchable
  acts_as_paranoid
  
  belongs_to :project
  belongs_to :user
  
  def owner?(u)
    user == u
  end
  
  def observer?(user)
    project.observer?(user)
  end

  def editable?(user)
    project.editable?(user)
  end
    
end