#encoding: utf-8
require 'rubygems'
require 'prawn'
require 'prawn/table' 
require 'prawn/core'
require 'prawn/security'
require 'prawn/layout'
class UtilitariosController < ApplicationController
  def recibo_avulso
    
  end
  
  def recibo_avulso_submit
    valor         = params[:valor]
    valor_extenso = params[:valor_extenso]
    data          = params[:data]
    recebedor     = params[:recebedor]
    referencia    = params[:referencia]
    
    items = Array.new
    pdf  = Prawn::Document.new(:page_size => 'A4', :layout => 'portrait') do |pdf|
      pdf.font_size 12
     
      pdf.text("RECIBO", :align => :center, :style => :bold)
      pdf.text("#{valor}", :align => :right, :style => :bold)
      pdf.text("
        Recebemos de #{recebedor}, a quantia de #{valor}(#{valor_extenso}), referente a #{referencia}.



      ")
      
      items << ["________________________________", "________________________________"]
      items << ["Colégio Impacto", recebedor]
      pdf.table items, :column_widths => { 0 => 250, 1 => 250}, :cell_style => {:borders => []}
    end
    send_data pdf.render, :filename => "recibo.pdf", :type => "application/pdf", :disposition => 'inline'
  end
end
