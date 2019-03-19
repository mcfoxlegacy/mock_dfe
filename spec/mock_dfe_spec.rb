require 'nokogiri'

RSpec.describe MockDfe do
  it 'has a version number' do
    expect(MockDfe::VERSION).not_to be nil
  end
  context 'Nfe' do
    it 'Generates a xml' do
      expect(MockDfe::Nfe.render('nfe')).to include('<nfeProc versao=')
      expect(MockDfe::Nfe.render('nfe')).to include('<NFe xmlns=')
      expect(MockDfe::Nfe.render('nfe')).to include('<infNFe Id=')
      expect(MockDfe::Nfe.render('nfe')).to include('<protNFe versao=')
    end

    let(:doc) { Nokogiri.XML(MockDfe::Nfe.render('nfe')) }
    let(:chave) { doc.css('nfeProc protNFe infProt chNFe').text }

    it 'Generates xml with data' do
      expect(doc.css('nfeProc NFe infNFe ide natOp').text).not_to be_empty
      expect(chave.size).to eq(44)
    end

    it 'validates xml key integrity' do
      prefix = 'nfeProc NFe infNFe'
      fields = ''
      fields << doc.css("#{prefix} ide cUF").text
      fields << Date.parse(doc.css("#{prefix} ide dhEmi").text).strftime('%y%m')
      fields << doc.css("#{prefix} emit CNPJ").text
      fields << doc.css("#{prefix} ide mod").text
      fields << doc.css("#{prefix} ide serie").text
      fields << doc.css("#{prefix} ide nNF").text
      fields << doc.css("#{prefix} ide tpEmis").text
      fields << doc.css("#{prefix} ide cNF").text
      expect(fields).to eq(chave.chop)
    end
  end
end
