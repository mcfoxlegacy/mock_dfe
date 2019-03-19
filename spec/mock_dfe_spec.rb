require 'nokogiri'

RSpec.describe MockDfe do
  it 'has a version number' do
    expect(MockDfe::VERSION).not_to be nil
  end

  describe 'Nfe' do
    context '4.00' do
      let(:nfe) { MockDfe::Nfe.render }

      it 'Generates a xml' do
        expect(nfe).to include('<nfeProc versao=')
        expect(nfe).to include('<NFe xmlns=')
        expect(nfe).to include('<infNFe Id=')
        expect(nfe).to include('<protNFe versao=')
      end

      let(:doc) { Nokogiri.XML(nfe) }
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

    context 'No template' do
      it 'raises an error' do
        expect { MockDfe::Nfe.render('invalid') }.to raise_error('There are no templates for NFe invalid.')
      end
    end
  end
end
