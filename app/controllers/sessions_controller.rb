class SessionsController < ApplicationController
  def new
    # Página de login
  end

  def create
    # Processar login
    email = params[:email]
    password = params[:password]
    
    # Aqui você implementaria a lógica de autenticação real
    # Por enquanto, vou fazer uma autenticação simples
    if email.present? && password.present?
      session[:user_email] = email
      redirect_to bilheteria_portaria_path, notice: "Login realizado com sucesso!"
    else
      flash.now[:alert] = "Email e senha são obrigatórios"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # Logout
    session[:user_email] = nil
    redirect_to root_path, notice: "Logout realizado com sucesso!"
  end
end
