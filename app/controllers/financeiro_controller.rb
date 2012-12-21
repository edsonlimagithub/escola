class FinanceiroController < ApplicationController
  
  def aluno_mensalidades
    @aluno = Aluno.find(params[:id])
    @mensalidades = @aluno.mensalidades
  end
  
  def gerar_mensalidades
    
  end
  
end
