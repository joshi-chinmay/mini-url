require 'rails_helper'

RSpec.describe ReferenceUrl, :type => :model do
  it "creates one Reference url" do
    reference_url = ReferenceUrl.new
    fake_url = Faker::Internet.url
    reference_url.associated_url = fake_url
    reference_url.save

    expect(reference_url.associated_url).to eq(fake_url)
  end
end
