class FinanceiroController < ApplicationController
  before_filter :authenticate_user!
  include ValueFormat
  include ModFinanceiro
  
  def aluno_mensalidades
    @aluno = Aluno.find(params[:id])
  end
  
  def gerar_mensalidades
    
    valor           = parsePriceToFloat params[:valor]
    data_vencimento = Time.parse(params[:data_vencimento])
    dia_vencimento  = params[:dia_vencimento].to_i
    quantidade      = params[:quantidade].to_i 
    
    (1..quantidade).each do
      gera_mensalidade params[:aluno_id], valor, data_vencimento 
      data_vencimento = data_vencimento + 1.month  
    end
    #render :nothing => true
    redirect_to "/financeiro/aluno_mensalidades/#{params[:aluno_id]}"
  end
  
end
