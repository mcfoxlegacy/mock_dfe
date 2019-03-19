require 'json'
require 'faker'
require 'erb'

Dir['./lib/mock_dfe/dfes/*.rb'].each { |file| require file }

require_relative 'mock_dfe/version'
require_relative 'mock_dfe/mock_dfe'

# method injection on the class Hash
class Hash
  def to_xml
    map do |k, v|
      text = Hash === v ? v.to_xml : v
      "<%s>%s</%s>" % [k, text, k] unless k[0] == '_'
    end.join
  end
end

COD_DA_UF = { RO: 11, AC: 12, AM: 13, RR: 14, PA: 15, AP: 16,
              TO: 17, MA: 21, PI: 22, CE: 23, RN: 24, PB: 25,
              PE: 26, AL: 27, SE: 28, BA: 29, MG: 31, ES: 32,
              RJ: 33, SP: 35, PR: 41, SC: 42, RS: 43, MS: 50,
              MT: 51, GO: 52, DF: 53 }.freeze
