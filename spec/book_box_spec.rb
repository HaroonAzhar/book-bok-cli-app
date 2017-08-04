require "spec_helper"

RSpec.describe BookBox do
  it "has a version number" do
    expect(BookBox::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
