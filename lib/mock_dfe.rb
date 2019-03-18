require 'mock_dfe/version'
require 'json'

require_relative 'mock_dfe/mock_dfe.rb'

# method injection on the class Hash
class Hash
  def to_xml
    map do |k, v|
      text = Hash === v ? v.to_xml : v
      "<%s>%s</%s>" % [k, text, k] unless k[0] == '_'
    end.join
  end
end
