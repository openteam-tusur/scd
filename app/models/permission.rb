class Permission < ActiveRecord::Base

  include AuthClient::Permission

  attr_accessible :role, :name, :user_id

  attr_accessor :name

  acts_as_auth_client_permission :roles => [:admin, :manager]

  delegate :fullname, :email, :to => :user, :prefix => true, :allow_nil => true

  validates_uniqueness_of :role, :scope => :user_id,
    :message => 'У пользователя не может быть несколько одинаковых ролей'

  def self.per_page
    20
  end

  def role_text
    I18n.t("role_names.#{role}", :title => '').strip
  end
end

# == Schema Information
#
# Table name: permissions
#
#  id           :integer          not null, primary key
#  context_id   :integer
#  context_type :string(255)
#  role         :string(255)
#  user_id      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#
