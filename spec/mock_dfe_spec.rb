RSpec.describe MockDfe do
  it "has a version number" do
    expect(MockDfe::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(MockDfe::Dfe.render('nfe')).to eq('nfe')
  end
end
