#encoding: utf-8
require 'prawn'
require 'prawn/table' 
require 'prawn/core'
require 'prawn/security'
require 'prawn/layout'
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
    
    if params[:turma_id] != ""
    	@mensalidades = Array.new
    	mensalidades_filtro.each do |mensalidade|
    		if mensalidade.aluno.turma == Turma.find(params[:turma_id])
    			@mensalidades << mensalidade
    		end
    	end
    else
	    @mensalidades = mensalidades_filtro
	end
	if params[:formato] == "pdf"
		pdf = mesalidades_pdf @mensalidades
	    send_data pdf.render, :filename => "mensalidades.pdf", :type => "application/pdf", :disposition => 'inline'
	end
  end

  private

  def mesalidades_pdf mensalidades
  	items = Array.new
	pdf  = Prawn::Document.new(:page_size => 'A4', :layout => 'portrait') do |pdf|
      pdf.font_size 14
      pdf.text "#{current_user.empresa.descricao}"
      pdf.text "Mensalidades em #{Time.now.strftime('%d/%m/%Y')}"
      pdf.font_size 10
     
      total = 0
      items << ["Aluno", "Turma", "Vencimento","Quitação", "Atraso", "Valor"]
      mensalidades.each do |mensalidade|
      	total = total + mensalidade.valor
      	items << [
      		mensalidade.aluno.nome,
      		mensalidade.aluno.turma ? mensalidade.aluno.turma.descricao : "",
      		mensalidade.vencimento.strftime("%d/%m/%Y"),
      		mensalidade.data_quitacao ? mensalidade.data_quitacao.strftime("%d/%m/%Y") : "",
      		mensalidade.data_quitacao ? "" : mensalidade.diasAtraso,
      		mensalidade.valor
      	]
      end

      pdf.table items, :row_colors => ["FFFFFF", "DDDDDD"], :header => true
      pdf.move_down 10
 	  pdf.text "Total ---: #{total}", :style => :bold, :align => :center     	
    end
	return pdf    
  end
end
