require "typekit_client"
require "spec_helper"
require "typekit_helper"
require "webmock/rspec"

include TypekitHelper

describe TypekitClient do
  let(:retriever) { TypekitClient.new }

  describe ".kits" do
    context "sucessful api response from typekit" do
      it "returns an array of kit ids" do
        stub_get_kits(kits_to_return: 2)
        expect(retriever.kits).to eq(["tqs1oxn", "tqs1oxn"])
      end
    end

    context "unsuccessful api response from typekit" do
       it "raises an error" do
        stub_get_kits_error
        expect{retriever.kits}.to raise_error(TypekitAPIError)
      end
    end
  end

  describe ".kit" do
    context "successful api response from typekit" do
      it "returns a hash of details about a specific kit" do
        kit_data = {
          name: "test",
          families: ["Acumin Pro", "Source Han Sans Traditional Chinese"]
        }
        stub_get_kit
        expect(retriever.kit(kit_id: "tqs1oxn")).to eq(kit_data)
      end
    end

    context "unsuccessful api response from typekit" do
      it "raises an error" do
        stub_get_kit_error
        expect{retriever.kit(kit_id: "bad_id")}.to raise_error(TypekitAPIError)
      end
    end
  end
end

