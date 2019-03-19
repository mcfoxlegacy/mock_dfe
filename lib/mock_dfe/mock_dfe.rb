module MockDfe
  # Your code goes here...
  class Nfe
    def self.render(version = 'default')
      template = self.render_template(version)
      generate_xml(template)
    end

    def self.render_template(version)
      @key_fields = Nfe400.new
      json_erb = File.read('./lib/mock_dfe/templates/nfe_4.00.json.erb')
      ERB.new(json_erb).result(binding)
    end

    def self.generate_xml(template)
      @params = JSON.parse(template)
      xml = File.read('./lib/mock_dfe/templates/nfe_4.00.xml.erb')
      ERB.new(xml).result(binding)
    end
  end
end
