require 'rails_helper'

RSpec.describe ReferenceUrl, :type => :model do

  before(:each) do
    @reference_url = ReferenceUrl.create(associated_url: Faker::Internet.url)
  end

  it "validates the instance of a model" do
    expect(@reference_url).to be_an_instance_of(ReferenceUrl)
  end

  it "creates one Reference url" do
    url = Faker::Internet.url
    @reference_url.associated_url = url
    @reference_url.save

    expect(@reference_url.associated_url).to eq(url)
  end

  it "validates the validation present og associated_url" do
    @reference_url.associated_url = nil

    expect(@reference_url.save).to eq(false)
  end

  it "validates that the default fields are present" do
    expect(ReferenceUrl.new.mini_url.length).to eq(10)
  end

  it "validates that the new url is assigned to the reference url model" do
    new_record = ReferenceUrl.new(mini_url: @reference_url.mini_url)

    expect(new_record.mini_url).not_to eql(@reference_url.mini_url)
  end

end
