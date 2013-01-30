#encoding: utf-8
require 'rubygems'
require 'prawn'
require 'prawn/table' 
require 'prawn/core'
require 'prawn/security'
require 'prawn/layout'
class FinanceiroController < ApplicationController
  #before_filter :authenticate_user!
  #load_and_authorize_resource
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
    redirect_to "/financeiro/aluno_mensalidades/#{params[:aluno_id]}"
  end
  
  def gerar_boletos
    mensalidade_ids =  params[:ids].split(",")
    aluno = Aluno.find(params[:aluno_id])
    mes = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"]
      
    pdf  = Prawn::Document.new(:page_size => 'A4', :layout => 'portrait') do
      font_size 10
      mensalidade_ids.each do |mensalidade_id|
        items = Array.new
          mensalidade   = Mensalidade.find(mensalidade_id)
          alunoNome     = "Aluno(a): #{aluno.nome}"
          vencimentoRef = "Vencimento: #{mensalidade.vencimento.strftime("%d/%m/%Y")}  Ref: #{mes[mensalidade.vencimento.month - 1]}"
          turmaTurno    = "Turma: #{aluno.turma.descricao} Turno: #{aluno.turma.turno}"
          valorMulta    = "Valor: #{mensalidade.valor}    Multa:___________" 
          totalPagoEm   = "Total:______________ Pago em ___/___/______" 
          
          items << ["Colégio Impacto","Colégio Impacto"]
          items << [alunoNome,     alunoNome]
          items << [vencimentoRef, vencimentoRef]
          items << [turmaTurno, turmaTurno]
          items << [valorMulta, valorMulta]
          items << [totalPagoEm, totalPagoEm]
                    
          table items, :header => true,
           :column_widths => { 0 => 250, 1 => 250},
           :cell_style => { :borders => [:left, :right] }
          move_down 10
       end
       
    end  
    send_data pdf.render, :filename => "mensalidades.pdf", :type => "application/pdf", :disposition => 'inline'
  end
  
  def mensalidade_baixa
    @mensalidade = Mensalidade.find(params[:id])
  end
  
  def mensalidade_baixa_confirma
    mensalidade = Mensalidade.find(params[:mensalidade_id])
    valor = parsePriceToFloat params[:valor]
    baixa = DateTime.parse(params[:data_quitacao]).to_s(:db)
    begin
      mensalidade.data_quitacao = baixa
      mensalidade.save
    rescue
      
    end  
    redirect_to "/financeiro/aluno_mensalidades/#{mensalidade.aluno.id}"
  end
  
end
