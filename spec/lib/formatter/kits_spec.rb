require "formatter/kits"

describe Formatter::Kits do
  describe ".format" do
    it "formats a kit list into user-facing output" do
      kits = ["kit1", "kit2"]
      kits_text = "Your kits:\nkit1\nkit2\n"
      expect(Formatter::Kits.new(unformatted_kits: kits).format).to eq(kits_text)
    end
  end
end
