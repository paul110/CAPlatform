# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#

class User < ApplicationRecord
  has_many :sketches
  has_many :boards

  def show_delete_path
    Rails.application.routes.url_helpers.admin_user_path(id)
  end

  def edit_path
    Rails.application.routes.url_helpers.edit_admin_user_path(id)
  end
end
