class RelatoriosController < ApplicationController
  def mensalidades_filtro
  	@turmas = current_user.empresa.turmas
  end

  def mensalidades
  	data_inicial = params[:data_inicial].to_date.to_s(:db)
  	data_final   = params[:data_final].to_date.to_s(:db)

  	if !params[:abertas]
  		filtro = 'and data_quitacao is not null'
  	end
  	if !params[:quitadas]
  		filtro = ' and data_quitacao is null'
  	end

    mensalidades_filtro = Mensalidade.find(:all, 
    	:conditions => ["vencimento between '#{data_inicial}' and '#{data_final}' #{filtro}"])
    
    if params[:turma_id]
    	@mensalidades = Array.new
    	mensalidades_filtro.each do |mensalidade|
    		if mensalidade.aluno.turma == Turma.find(params[:turma_id])
    			@mensalidades << mensalidade
    		end
    	end
    else
	    @mensalidades = mensalidades_filtro
	end 
    #abort @mensalidades
  end
end
