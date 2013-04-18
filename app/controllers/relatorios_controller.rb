class RelatoriosController < ApplicationController
  def mensalidades_atrasadas
    hoje = Time.now.strftime("%Y-%m-%d")
    @mensalidades = Mensalidade.find(:all, :conditions => ["vencimento < '#{hoje}' and data_quitacao is null"])
  end
end
