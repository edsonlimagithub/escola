# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121228132744) do

  create_table "alunos", :force => true do |t|
    t.integer  "matricula"
    t.string   "nome"
    t.date     "data_nascimento"
    t.string   "logradouro"
    t.string   "logradouro_numero"
    t.string   "logradouro_complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "uf"
    t.string   "tipo_sanguineo"
    t.date     "data_vencimento"
    t.string   "sexo"
    t.string   "fone"
    t.string   "fone2"
    t.text     "observacao"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "dia_vencimento"
    t.integer  "empresa_id"
    t.integer  "turma_id"
  end

  create_table "empresas", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mensalidades", :force => true do |t|
    t.integer  "aluno_id"
    t.date     "vencimento"
    t.float    "valor"
    t.float    "desconto"
    t.float    "multa"
    t.float    "juros"
    t.date     "data_quitacao"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "empresa_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "turmas", :force => true do |t|
    t.string   "descricao"
    t.date     "dt_inicio"
    t.date     "dt_fim"
    t.integer  "limite_alunos"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "empresa_id"
    t.string   "turno"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "empresa_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
