require "formatter/kit"

describe Formatter::Kit do
  describe ".format" do
    it "formats a kit hash into user-facing output" do
      kit = {
        name: "test",
        families: ["Acumin Pro", "Source Han Sans Traditional Chinese"]
      }
      kit_text = "Kit name: test\nFamilies:\nAcumin Pro\nSource Han Sans Traditional Chinese\n"
      expect(Formatter::Kit.new(unformatted_kit: kit).format).to eq(kit_text)
    end
  end
end
