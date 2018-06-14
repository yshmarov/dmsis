class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [ :privacy_policy, :terms_of_service, :contacts ]

  def privacy_policy
  end

  def terms_of_service
  end

  def contacts
  end

end
