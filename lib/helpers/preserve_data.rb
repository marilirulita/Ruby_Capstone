def save_data(data, file)
  json = JSON.generate(data)
  File.write("./lib/preserve_data/#{file}.json", json)
end

def recover_data(file)
  return unless File.exist?("./lib/preserve_data/#{file}.json") == true

  json = File.read("./lib/preserve_data/#{file}.json")
  JSON.parse(json, create_additions: true)
end
