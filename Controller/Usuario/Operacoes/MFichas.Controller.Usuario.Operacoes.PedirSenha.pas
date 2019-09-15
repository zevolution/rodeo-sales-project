unit MFichas.Controller.Usuario.Operacoes.PedirSenha;

interface

uses
  MFichas.Controller.Usuario.Operacoes.Interfaces,
  MFichas.Controller.Types;

type
  TControllerUsuarioOperacoesPedirSenha = class(TInterfacedObject, iControllerUsuarioOperacoes, iControllerUsuarioOperacoesPedirSenha)
  private
    FTitle      : String;
    FTextConfirm: String;
    FTextCancel : String;
    FChamada    : TTypeTipoUsuario;
    FOperacao   : TTypePermissoesUsuario;
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iControllerUsuarioOperacoes;
    function PedirSenha: iControllerUsuarioOperacoesPedirSenha;
    function SetTitle(ATitle: String)                 : iControllerUsuarioOperacoesPedirSenha;
    function SetTextConfirm(ATextConfirm: String)     : iControllerUsuarioOperacoesPedirSenha;
    function SetTextCancel(ATextCancel: String)       : iControllerUsuarioOperacoesPedirSenha;
    function SetChamada(AChamada: TTypeTipoUsuario): iControllerUsuarioOperacoesPedirSenha;
    function SetOperacao(AOperacao: TTypePermissoesUsuario): iControllerUsuarioOperacoesPedirSenha;
    function &End                                     : iControllerUsuarioOperacoesPedirSenha;
  end;

implementation

uses
  MaykoFichas.View.Principal;

{ TControllerUsuarioOperacoesPedirSenha }

function TControllerUsuarioOperacoesPedirSenha.&End: iControllerUsuarioOperacoesPedirSenha;
begin
  Result := Self;
  Form3
    .ExibirFormSenha(
      FTitle,
      FTextConfirm,
      FTextCancel,
      FChamada,
      FOperacao
    );
end;

constructor TControllerUsuarioOperacoesPedirSenha.Create;
begin

end;

destructor TControllerUsuarioOperacoesPedirSenha.Destroy;
begin

  inherited;
end;

class function TControllerUsuarioOperacoesPedirSenha.New: iControllerUsuarioOperacoes;
begin
  Result := Self.Create;
end;

function TControllerUsuarioOperacoesPedirSenha.PedirSenha: iControllerUsuarioOperacoesPedirSenha;
begin
  Result := Self;
end;

function TControllerUsuarioOperacoesPedirSenha.SetChamada(AChamada: TTypeTipoUsuario): iControllerUsuarioOperacoesPedirSenha;
begin
  Result   := Self;
  FChamada := AChamada;
end;

function TControllerUsuarioOperacoesPedirSenha.SetOperacao(
  AOperacao: TTypePermissoesUsuario): iControllerUsuarioOperacoesPedirSenha;
begin
  Result    := Self;
  FOperacao := AOperacao;
end;

function TControllerUsuarioOperacoesPedirSenha.SetTextCancel(ATextCancel: String)  : iControllerUsuarioOperacoesPedirSenha;
begin
  Result      := Self;
  FTextCancel := ATextCancel;
end;

function TControllerUsuarioOperacoesPedirSenha.SetTextConfirm(ATextConfirm: String): iControllerUsuarioOperacoesPedirSenha;
begin
  Result       := Self;
  FTextConfirm := ATextConfirm;
end;

function TControllerUsuarioOperacoesPedirSenha.SetTitle(ATitle: String)            : iControllerUsuarioOperacoesPedirSenha;
begin
  Result := Self;
  FTitle := ATitle;
end;

end.