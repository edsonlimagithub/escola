module FinanceiroHelper
  def link_baixa mensalidade
    if mensalidade.data_quitacao.nil?
      return link_to 'Baixar', "/financeiro/mensalidade_baixa/#{mensalidade.id}"
    else
      return mensalidade.data_quitacao
    end
  end
end
