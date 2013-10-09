class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    User.last.update_attribute(:is_admin, (params['user']['is_admin'] == "1" ? true : false))
  end

  def update
    super
  end
end 