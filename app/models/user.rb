class User

  include AuthClient::User

  acts_as_auth_client_user

  def app_name
    Settings['app.host'].to_s.parameterize('_')
  end

  Permission.available_roles.each do |role|
    define_method "#{role}?" do
      has_permission? role: role
    end
  end

end
