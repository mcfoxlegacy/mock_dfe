module MockDfe
  # Your code goes here...
  class Dfe
    def self.render(dfe)
      json_erb = File.read('./lib/mock_dfe/templates/nfe_4.00.json.erb')
      json = ERB.new(json_erb).result(binding)
      @params = JSON.parse(json)
      xml = File.read('./lib/mock_dfe/templates/nfe_4.00.xml.erb')
      xml_erb = ERB.new(xml).result(binding)
      xml_erb
    end
  end
end
