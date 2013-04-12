
require "multi_json"
require "open-uri"
# require "open-uri/cached"
require "sinatra"
require "sinatra/json"
require "sinatra/reloader" if development?

# Configuration ---------------------------------------------------------------

set :api_key, ""

# Traffic ---------------------------------------------------------------------

get "/traffic/:gauge_id" do |gauge_id|

  api_key = params[:api_key] || settings.api_key
  api_response = nil
  graph = {}

  # Request traffic data from Gauges
  open("https://secure.gaug.es/gauges/#{gauge_id}/traffic", "X-Gauges-Token" => api_key) do |response|
    api_response = MultiJson.load(response.read)
  end

  # Graph Title
  graph[:title] = "Foo"

  # Graph Type
  graph[:type] = "line"

  # Show Totals
  graph[:total] = true

  # Data Sequences
  graph[:datasequences] = []

  # Views
  views = { :title => "Views", :datapoints => [] }
  api_response["traffic"].each do |entry|
    views[:datapoints] << {
      :title => entry["date"],
      :value => entry["views"]
    }
  end
  graph[:datasequences] << views

  # People
  people = { :title => "People", :datapoints => [] }
  api_response["traffic"].each do |entry|
    people[:datapoints] << {
      :title => entry["date"],
      :value => entry["people"]
    }
  end
  graph[:datasequences] << people

  # Return the Graph JSON
  json :graph => graph

end
