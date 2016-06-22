module TypekitHelper
  def party
    raise
  end

  def stub_get_kits(kits_to_return:)
    kit_array = []
    example_kit = {
      "id": "tqs1oxn",
      "link": "/api/v1/json/kits/tqs1oxn"
    }
    kits_to_return.times { kit_array << example_kit }
    body_response = { "kits": kit_array }.to_json
    stub_request(:get, "https://typekit.com/api/v1/json/kits").
      with(:headers => { 'X-Typekit-Token'=>/.*./}).
      to_return(:status => 200, :body => body_response, :headers => {})
  end

  def stub_get_kits_error
    body_response =
      { "errors": [ "An error" ] }.to_json
    stub_request(:get, "https://typekit.com/api/v1/json/kits").
      with(:headers => { 'X-Typekit-Token'=>/.*./}).
      to_return(:status => 400, :body => body_response, :headers => {})
  end

  def stub_get_kit
    body_response = example_kit.to_json
    stub_request(:get, "https://typekit.com/api/v1/json/kits/tqs1oxn").
      with(:headers => { 'X-Typekit-Token'=>/.*./}).
      to_return(:status => 200, :body => body_response, :headers => {})

  end

  def example_kit
    {
      "kit": {
        "id": "tqs1oxn",
        "name": "test",
        "analytics": false,
        "domains": [
          "example.com"
        ],
        "families": [
          {
            "id": "nyty",
            "name": "Acumin Pro",
            "slug": "acumin-pro",
            "css_names": [
              "acumin-pro"
            ],
            "css_stack": "\"acumin-pro\",sans-serif",
            "subset": "default",
            "variations": [
              "n4",
              "i4",
              "n7",
              "i7"
            ]
          },
          {
            "id": "qhzx",
            "name": "Source Han Sans Traditional Chinese",
            "slug": "source-han-sans-traditional-chinese",
            "css_names": [
              "source-han-sans-traditional"
            ],
            "css_stack": "\"source-han-sans-traditional\",sans-serif",
            "subset": "default",
            "variations": [
              "n4",
              "n7"
            ]
          }
        ],
        "optimize_performance": false
      }
    }
  end

  def stub_get_kit_error
    body_response =
      { "errors": [ "An error" ] }.to_json
    stub_request(:get, "https://typekit.com/api/v1/json/kits/bad_id").
      with(:headers => { 'X-Typekit-Token'=>/.*./}).
      to_return(:status => 400, :body => body_response, :headers => {})
  end
end
