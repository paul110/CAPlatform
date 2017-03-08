class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  NotImplemented = Class.new(RuntimeError)

  def show_delete_path
    raise NotImplemented, "show_delete_path not implemented for #{self.class.to_s}"
  end

  def edit_path
    raise NotImplemented, "edit_path not implemented for #{self.class.to_s}"
  end
end
