RSpec.describe MockDfe do
  it "has a version number" do
    expect(MockDfe::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(MockDfe::Dfe.render('nfe')).to include("<nfeProc versao=")
    expect(MockDfe::Dfe.render('nfe')).to include("<NFe xmlns=")
    expect(MockDfe::Dfe.render('nfe')).to include("<infNFe Id=")
    expect(MockDfe::Dfe.render('nfe')).to include("<protNFe versao=")
  end
end
