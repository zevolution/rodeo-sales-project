unit MFichas.Model.Usuario.Funcoes.Cadastrar;

interface

uses
  System.SysUtils,

  MFichas.Model.Usuario.Interfaces,
  MFichas.Model.Entidade.USUARIO,

  MFichas.Controller.Types;

type
  TModelUsuarioFuncoesCadastrar = class(TInterfacedObject, iModelUsuarioFuncoesCadastrar)
  private
    [weak]
    FParent  : iModelUsuario;
    FEntidade: TUSUARIO;
    FLogin   : String;
    FNome    : String;
    FSenha   : String;
    FTipoUsuario  : Integer;
    constructor Create(AParent: iModelUsuario);
    procedure Gravar;
  public
    destructor Destroy; override;
    class function New(AParent: iModelUsuario): iModelUsuarioFuncoesCadastrar;
    function Login(ALogin: String)         : iModelUsuarioFuncoesCadastrar;
    function Nome(ANomeUsuario: String)    : iModelUsuarioFuncoesCadastrar;
    function Senha(ASenha: String)         : iModelUsuarioFuncoesCadastrar;
    function TipoUsuario(ABoolean: Integer): iModelUsuarioFuncoesCadastrar;
    function &End                          : iModelUsuarioFuncoes;
  end;

implementation

{ TModelUsuarioFuncoesCadastrar }

function TModelUsuarioFuncoesCadastrar.&End: iModelUsuarioFuncoes;
begin
  Result := FParent.Funcoes;
  Gravar;
end;

constructor TModelUsuarioFuncoesCadastrar.Create(AParent: iModelUsuario);
begin
  FParent   := AParent;
  FEntidade := TUSUARIO.Create;
end;

destructor TModelUsuarioFuncoesCadastrar.Destroy;
begin
  {$IFDEF MSWINDOWS}
  FreeAndNil(FEntidade);
  {$ELSE}
  FEntidade.Free;
  FEntidade.DisposeOf;
  {$ENDIF}
  inherited;
end;

function TModelUsuarioFuncoesCadastrar.TipoUsuario(ABoolean: Integer)
  : iModelUsuarioFuncoesCadastrar;
begin
  Result       := Self;
  FTipoUsuario := ABoolean;
end;

procedure TModelUsuarioFuncoesCadastrar.Gravar;
begin
  FEntidade.NOME   := FNome;
  FEntidade.LOGIN  := FLogin;
  FEntidade.SENHA  := FSenha;
  FEntidade.TIPO   := FTipoUsuario;
  FEntidade.STATUS := Integer(saiAtivo);
  FParent.DAO.Insert(FEntidade);
end;

function TModelUsuarioFuncoesCadastrar.Login(
  ALogin: String): iModelUsuarioFuncoesCadastrar;
begin
  Result := Self;
  FLogin := ALogin.ToUpper;
end;

class function TModelUsuarioFuncoesCadastrar.New(AParent: iModelUsuario): iModelUsuarioFuncoesCadastrar;
begin
  Result := Self.Create(AParent);
end;

function TModelUsuarioFuncoesCadastrar.Nome(
  ANomeUsuario: String): iModelUsuarioFuncoesCadastrar;
begin
  Result := Self;
  FNome  := ANomeUsuario.ToUpper;
end;

function TModelUsuarioFuncoesCadastrar.Senha(
  ASenha: String): iModelUsuarioFuncoesCadastrar;
begin
  Result := Self;
  FSenha := ASenha;
end;

end.
