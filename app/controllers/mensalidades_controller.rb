class MensalidadesController < ApplicationController
  def edit
    @mensalidade = Mensalidade.find(params[:id])
  end
  
  def update
    @mensalidade = Mensalidade.find(params[:id])
    respond_to do |format|
      if @mensalidade.update_attributes(params[:mensalidade])
        format.html { redirect_to "/financeiro/aluno_mensalidades/#{@mensalidade.aluno.id}", notice: 'Mensalidade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mensalidade.errors, status: :unprocessable_entity }
      end
    end
  end
  
end