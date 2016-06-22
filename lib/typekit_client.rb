require 'httparty'

class TypekitClient
  include HTTParty
  base_uri 'https://typekit.com/api/v1/json'
  format :json

  attr_reader :options

  def initialize
    @options = { headers: headers }
  end

  def kits
    response = self.class.get("/kits", options)
    if response.success?
      response["kits"].map {|k| k["id"] }
    else
      handle_error(response)
    end
  end

  def kit(kit_id:)
    response = self.class.get("/kits/#{kit_id}", options)
    if response.success?
      {
        name: response["kit"]["name"],
        families: parse_family_names(response["kit"]["families"])
      }
    else
      handle_error(response)
    end
  end

  private

  def headers
    { "X-Typekit-Token" => api_key }
  end

  def api_key
    config = YAML.load(File.read(File.expand_path('../../config/application.yml', __FILE__)))
    config["typekit_api_key"]
  end

  def parse_family_names(families)
    families.map { |f| f["name"] }
  end

  def handle_error(response)
    raise TypekitAPIError, response["errors"].join(", ")
  end
end

class TypekitAPIError < StandardError
end
