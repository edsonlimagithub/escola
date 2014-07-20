module FinanceiroHelper
  def link_baixa mensalidade
    if mensalidade.data_quitacao.nil?
      return link_to 'Baixar', "/financeiro/mensalidade_baixa/#{mensalidade.id}"
    else
      return mensalidade.data_quitacao.strftime("%d/%m/%Y")
    end
  end

  def link_baixa_rapida mensalidade
    if mensalidade.data_quitacao.nil?
      return link_to 'Baixar Rapida', "#", :class => 'btn btn-yellow', :onclick => "confirma_baixa_rapida(#{mensalidade.id})"
    else
      return " "
    end
  end
end
