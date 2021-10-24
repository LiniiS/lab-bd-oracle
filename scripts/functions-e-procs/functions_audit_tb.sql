-- Função para coletar/retornar o usuário_bd
create function busca_usuario return VARCHAR
as
    v_usuario VARCHAR(30);
begin
    select user into v_usuario from dual;
    return v_usuario;
end;
