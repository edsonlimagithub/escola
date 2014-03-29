class MensalidadesController < ApplicationController
  skip_before_filter :verify_authenticity_token

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

  def destroy
    @mensalidade = Mensalidade.find(params[:id])
    aluno = @mensalidade.aluno
    @mensalidade.destroy

    respond_to do |format|
      format.html { redirect_to "/financeiro/aluno_mensalidades/#{aluno.id}" }
      format.json { head :no_content }
    end
  end
  
end