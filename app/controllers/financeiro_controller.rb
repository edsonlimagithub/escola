class FinanceiroController < ApplicationController
  before_filter :authenticate_user!
  include ValueFormat
  
  def aluno_mensalidades
    @aluno = Aluno.find(params[:id])
  end
  
  def gerar_mensalidades
    valor      = parsePriceToFloat params[:valor]
    data       = Time.parse(params[:data_vencimento]).to_s(:db)
    intervalo  = params[:intervalo].to_i
    quantidade = params[:quantidade].to_i 
    abort valor.inspect
  end
  
end
