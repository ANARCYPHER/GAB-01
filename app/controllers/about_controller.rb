# frozen_string_literal: true

class AboutController < ApplicationController
  layout 'public'

  before_action :set_instance_presenter, only: [:show, :more, :terms, :privacy, :investors, :dmca, :sales]

  def show
    if user_signed_in?
      redirect_to "/home"
    else
      @hide_navbar = false
    end
  end

  private

  def new_user
    User.new.tap do |user|
      user.build_account
    end
  end

  helper_method :new_user

  def set_instance_presenter
    @instance_presenter = InstancePresenter.new
  end
end
