class ReferenceUrlsController < ApplicationController
  before_action :get_referennce_url, only: [:navigate, :convert]
  before_action :set_new_reference_url, only: :generate

  def convert
    respond_to do |format|
      if @reference_url.present?
        format.json { render json: @reference_url }
      else
        format.json { render json: {} }
      end
    end
  end

  def generate
    url = permitted_attributes[:mini_url]

    if @reference_url.new_record?
      @reference_url.associated_url = url
      @reference_url.save
    end

    respond_to do |format|
      if @reference_url.persisted?
        format.json { render json: @reference_url.to_json, status: :ok }
      else
        format.json { render json: {error: @reference_url.errors.full_messages.to_sentence} }
      end
    end
  end

  def navigate
    if @reference_url.present? && @reference_url.associated_url.present?
      redirect_to @reference_url.associated_url
    else
      render "invalid"
    end
  end

  private
  def get_referennce_url
    @reference_url = ReferenceUrl.find_by(mini_url: params[:mini_url_code])
  end

  def set_new_reference_url
    @reference_url = ReferenceUrl.find_by(associated_url: permitted_attributes[:mini_url])
    @reference_url = ReferenceUrl.new if @reference_url.blank?
  end

  def permitted_attributes
    params.permit(:mini_url)
  end
end
