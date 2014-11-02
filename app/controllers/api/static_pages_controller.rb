class Api::StaticPagesController < ApplicationController
  def dashboard
    render :dashboard
  end
end