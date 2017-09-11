class ReferenceUrlsController < ApplicationController
  before_action :get_referennce_url, only: :url

  def generate
  end

  def url
    if @reference_url.present?
      redirect_to @reference_url.associated_url
    else
      render "invalid"
    end
  end

  private
  def get_referennce_url
    @reference_url = ReferenceUrl.find_by(mini_url: params[:mini_url_code])
  end

end
