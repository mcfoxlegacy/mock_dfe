# template for NFe 4.00
class Nfe400
  attr_reader :emit_date, :cUF, :AAMM, :CNPJ, :mod, :serie, :nNF, :tpEmis, :cNF, :cDV, :chave

  def initialize
    @emit_date = DateTime.parse(Faker::Date.backward(1825).to_s)
    @cUF =  COD_DA_UF.values.sample
    @AAMM = @emit_date.strftime('%y%m')
    @CNPJ = CNPJ.generate
    @mod = '55'
    @serie = '002'
    @nNF = Faker::Number.between(1, 999_999_999).to_s.rjust(9, '0')
    @tpEmis = '1'
    @cNF = Faker::Number.number(8)
    chave_sem_cdv = "#{@cUF}#{@AAMM}#{@CNPJ}#{@mod}#{@serie}#{@nNF}#{@tpEmis}#{@cNF}"
    @cDV = calculate_cdv(chave_sem_cdv)
    @chave = "#{chave_sem_cdv}#{@cDV}"
  end

  def calculate_cdv(chave)
    soma = 0
    multiplicador = 2

    [*0..42].reverse_each do |i|
      soma += (chave[i].to_i * multiplicador)
      multiplicador += 1
      multiplicador = 2 if multiplicador > 9
    end
    resto = soma % 11
    digito_verificador = 11 - resto
    digito_verificador = 0 if digito_verificador >= 10
    digito_verificador
  end
end
