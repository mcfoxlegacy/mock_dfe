RSpec.describe Nfe400 do
  it 'validates cDV calculation' do
    real_key = '35100472381189000625550010005499747194541249'
    nfe400 = Nfe400.new
    result = nfe400.calculate_cdv(real_key.chop)
    expect(result.to_s).to eq(real_key[43])
  end
end
