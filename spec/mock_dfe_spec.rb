RSpec.describe MockDfe do
  it "has a version number" do
    expect(MockDfe::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(MockDfe::Nfe.render('nfe')).to include("<nfeProc versao=")
    expect(MockDfe::Nfe.render('nfe')).to include("<NFe xmlns=")
    expect(MockDfe::Nfe.render('nfe')).to include("<infNFe Id=")
    expect(MockDfe::Nfe.render('nfe')).to include("<protNFe versao=")
  end
end
