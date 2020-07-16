require_relative '../lib/dark_trader.rb'

describe "the crypto scrapper function" do
  it "should be a hash" do
    expect(merge_symbols_values).to be_instance_of(Hash)
  end
  it "should not be nil" do
    expect(merge_symbols_values).not_to be_nil
  end
  it "should not be empty" do
    expect(merge_symbols_values).not_to be_empty
  end
end