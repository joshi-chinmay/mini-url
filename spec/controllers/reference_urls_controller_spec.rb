require 'rails_helper'

RSpec.describe ReferenceUrlsController, type: :controller do

  before(:each) do
    @reference_url = ReferenceUrl.create(associated_url: Faker::Internet.url)
  end

  it "redirects to mini url" do
    post :navigate, mini_url_code: @reference_url.mini_url

    expect(response).to redirect_to @reference_url.associated_url
  end

  it "render 'invalid' template" do
    post :navigate, mini_url_code: Faker::Lorem.word

    expect(response.redirect?).to be false
  end

  it "creates new reference url" do
    url = Faker::Internet.url
    post :generate, mini_url: url, format: :json

    expect(JSON.parse(response.body)["associated_url"]).to eq(url)
  end

  it "creates new reference url" do
    post :generate, mini_url: Faker::Internet.url, format: :json

    expect(JSON.parse(response.body)["mini_url"].present?).to be(true)
  end

  it "creates new reference url" do
    post :generate, mini_url: Faker::Lorem.word, format: :json

    expect(JSON.parse(response.body)["error"]).to include("Associated url is invalid")
  end

  it "validates the response as 200" do
    post :generate, mini_url: Faker::Internet.url, format: :json

    expect(response.status).to be(200)
  end

  it "validates the response as 200" do
    get :convert, mini_url_code: @reference_url.mini_url, format: :json

    expect(JSON.parse(response.body)["associated_url"]).to eq(@reference_url.associated_url)
  end

  it "validates the response as 200" do
    get :convert, mini_url_code: Faker::Lorem.word, format: :json

    expect(JSON.parse(response.body)).to eq({})
  end

end
