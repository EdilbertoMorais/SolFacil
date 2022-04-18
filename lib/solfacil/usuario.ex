defmodule Solfacil.Usuario do
  @chaves_necessarias [:email, :senha]

  @enforce_keys @chaves_necessarias
  defstruct @chaves_necessarias

  def usuario(email, senha) do
    %Solfacil.Usuario{
      email: email,
      senha: senha
    }
  end
end
