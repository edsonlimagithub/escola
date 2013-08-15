Escola::Application.routes.draw do
  resources :turmas

  resources :alunos

  resources :roles

  resources :empresas
  
  resources :mensalidades

  devise_for :users, :path_prefix => 'my'
  resources :users
  
  match '/financeiro/aluno_mensalidades/:id'     => 'financeiro#aluno_mensalidades'
  match '/financeiro/gerar_mensalidades'         => 'financeiro#gerar_mensalidades'
  match '/financeiro/gerar_boletos'              => 'financeiro#gerar_boletos'
  match '/financeiro/mensalidade_baixa/:id'      => 'financeiro#mensalidade_baixa'
  match '/financeiro/mensalidade_baixa_confirma' => 'financeiro#mensalidade_baixa_confirma'
  
  match '/turma/dashboard/:partial'              => 'turmas#dashboard'
  
  match '/utilitarios/recibo_avulso'             => 'utilitarios#recibo_avulso'
  match '/utilitarios/recibo_avulso_submit'      => 'utilitarios#recibo_avulso_submit'
  

  #filtro para mensalides vencidas
  match '/relatorio/mensalidades_atrasadas_filtro' => 'relatorios#mensalidades_atrasadas_filtro'
  #mensalidades vencidas
  match '/relatorio/mensalidades_atrasadas'        => 'relatorios#mensalidades_atrasadas'
  

  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
