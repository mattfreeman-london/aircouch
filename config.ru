require_relative './app'

# config.serve_static_assets = true

map "/public" do
  run Rack::Directory.new("./public")
end

run AirCouch