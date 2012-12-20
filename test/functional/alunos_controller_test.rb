require 'test_helper'

class AlunosControllerTest < ActionController::TestCase
  setup do
    @aluno = alunos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alunos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aluno" do
    assert_difference('Aluno.count') do
      post :create, aluno: { bairro: @aluno.bairro, cidade: @aluno.cidade, data_nascimento: @aluno.data_nascimento, data_vencimento: @aluno.data_vencimento, fone2: @aluno.fone2, fone: @aluno.fone, logradouro: @aluno.logradouro, logradouro_complemento: @aluno.logradouro_complemento, logradouro_numero: @aluno.logradouro_numero, matricula: @aluno.matricula, nome: @aluno.nome, observacao: @aluno.observacao, sexo: @aluno.sexo, tipo_sanguineo: @aluno.tipo_sanguineo, uf: @aluno.uf }
    end

    assert_redirected_to aluno_path(assigns(:aluno))
  end

  test "should show aluno" do
    get :show, id: @aluno
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aluno
    assert_response :success
  end

  test "should update aluno" do
    put :update, id: @aluno, aluno: { bairro: @aluno.bairro, cidade: @aluno.cidade, data_nascimento: @aluno.data_nascimento, data_vencimento: @aluno.data_vencimento, fone2: @aluno.fone2, fone: @aluno.fone, logradouro: @aluno.logradouro, logradouro_complemento: @aluno.logradouro_complemento, logradouro_numero: @aluno.logradouro_numero, matricula: @aluno.matricula, nome: @aluno.nome, observacao: @aluno.observacao, sexo: @aluno.sexo, tipo_sanguineo: @aluno.tipo_sanguineo, uf: @aluno.uf }
    assert_redirected_to aluno_path(assigns(:aluno))
  end

  test "should destroy aluno" do
    assert_difference('Aluno.count', -1) do
      delete :destroy, id: @aluno
    end

    assert_redirected_to alunos_path
  end
end
