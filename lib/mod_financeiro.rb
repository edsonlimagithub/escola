module ModFinanceiro
  
  def gera_mensalidade aluno_id, valor, data_vencimento
    mensalidade = Mensalidade.new({:aluno_id => aluno_id,
                                   :valor => valor,
                                   :vencimento => data_vencimento,
                                   :empresa_id => current_user.empresa_id})
    mensalidade.save
    return mensalidade.id
  end 
  
end