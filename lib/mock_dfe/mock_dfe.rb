module MockDfe
  class Nfe
    class << self
      def render(version = 'default')
        template = render_template(version)
        generate_xml(template)
      end

      private

      def render_template(version)
        case version
        when '4.00', 'default'
          @key_fields = Nfe400.new
          json_erb = File.read("#{File.expand_path("../../", __FILE__)}/mock_dfe/templates/nfe_4.00.json.erb")
        else
          raise "There are no templates for NFe #{version}."
        end
        load_erb(json_erb)
      end

      def generate_xml(template)
        @params = JSON.parse(template)
        xml = File.read("#{File.expand_path("../../", __FILE__)}/mock_dfe/templates/nfe_4.00.xml.erb")
        load_erb(xml)
      end

      def load_erb(template)
        ERB.new(template).result(binding)
      end
    end
  end
end
