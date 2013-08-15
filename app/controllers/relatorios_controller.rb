class RelatoriosController < ApplicationController
  def mensalidades_atrasadas_filtro
  	@turmas = current_user.empresa.turmas

  end

  def mensalidades_atrasadas
    hoje = Time.now.strftime("%Y-%m-%d")
    @mensalidades = Mensalidade.find(:all, :conditions => ["vencimento < '#{hoje}' and data_quitacao is null"]).aluno
    abort @mensalidades
  end
end
