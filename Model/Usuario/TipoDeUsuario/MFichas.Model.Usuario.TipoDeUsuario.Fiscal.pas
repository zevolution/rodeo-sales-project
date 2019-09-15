unit MFichas.Model.Usuario.TipoDeUsuario.Fiscal;

interface

uses
  MFichas.Model.Usuario.Interfaces,

  MFichas.Controller.Usuario.Operacoes.Interfaces,
  MFichas.Controller.Types;

type
  TModelUsuarioTipoDeUsuarioFiscal = class(TInterfacedObject, iModelUsuarioMetodos)
  private
    [weak]
    FParent            : iModelUsuario;
    FNextResponsibility: iModelUsuarioMetodos;
    FOperacoes         : iControllerUsuarioOperacoes;
    constructor Create(AParent: iModelUsuario);
    procedure PedirSenha;
  public
    destructor Destroy; override;
    class function New(AParent: iModelUsuario): iModelUsuarioMetodos;
    function SetOperacoes(AOperacoes: iControllerUsuarioOperacoes): iModelUsuarioMetodos;
    function NextReponsibility(AValue: iModelUsuarioMetodos): iModelUsuarioMetodos;
    function LogoENomeDaFesta           : iModelUsuarioMetodos;
    function AbrirCaixa                 : iModelUsuarioMetodos;
    function FecharCaixa                : iModelUsuarioMetodos;
    function Suprimento                 : iModelUsuarioMetodos;
    function Sangria                    : iModelUsuarioMetodos;
    function CadastrarProdutos          : iModelUsuarioMetodos;
    function CadastrarGrupos            : iModelUsuarioMetodos;
    function CadastrarUsuarios          : iModelUsuarioMetodos;
    function AcessarRelatorios          : iModelUsuarioMetodos;
    function AcessarConfiguracoes       : iModelUsuarioMetodos;
    function ExcluirProdutosPosImpressao: iModelUsuarioMetodos;
    function &End                       : iModelUsuario;
  end;

implementation

{ TModelUsuarioTipoDeUsuarioFiscal }

function TModelUsuarioTipoDeUsuarioFiscal.&End: iModelUsuario;
begin
  Result := FParent;
end;

function TModelUsuarioTipoDeUsuarioFiscal.AbrirCaixa: iModelUsuarioMetodos;
begin
  Result := Self;
  PedirSenha;
end;

function TModelUsuarioTipoDeUsuarioFiscal.AcessarConfiguracoes: iModelUsuarioMetodos;
begin
  Result := Self;
  PedirSenha;
end;

function TModelUsuarioTipoDeUsuarioFiscal.AcessarRelatorios: iModelUsuarioMetodos;
begin
  Result := Self;
  PedirSenha;
end;

function TModelUsuarioTipoDeUsuarioFiscal.CadastrarGrupos: iModelUsuarioMetodos;
begin
  Result := Self;
  PedirSenha;
end;

function TModelUsuarioTipoDeUsuarioFiscal.CadastrarProdutos: iModelUsuarioMetodos;
begin
  Result := Self;
  PedirSenha;
end;

function TModelUsuarioTipoDeUsuarioFiscal.CadastrarUsuarios: iModelUsuarioMetodos;
begin
  Result := Self;
  FNextResponsibility.CadastrarUsuarios;
end;

constructor TModelUsuarioTipoDeUsuarioFiscal.Create(AParent: iModelUsuario);
begin
  FParent := AParent;
end;

destructor TModelUsuarioTipoDeUsuarioFiscal.Destroy;
begin

  inherited;
end;

function TModelUsuarioTipoDeUsuarioFiscal.ExcluirProdutosPosImpressao: iModelUsuarioMetodos;
begin
  Result := Self;
  PedirSenha;
end;

function TModelUsuarioTipoDeUsuarioFiscal.FecharCaixa: iModelUsuarioMetodos;
begin
  Result := Self;
  PedirSenha;
end;

function TModelUsuarioTipoDeUsuarioFiscal.LogoENomeDaFesta: iModelUsuarioMetodos;
begin
  Result := Self;
  PedirSenha;
end;

class function TModelUsuarioTipoDeUsuarioFiscal.New(AParent: iModelUsuario): iModelUsuarioMetodos;
begin
  Result := Self.Create(AParent);
end;

function TModelUsuarioTipoDeUsuarioFiscal.NextReponsibility(
  AValue: iModelUsuarioMetodos): iModelUsuarioMetodos;
begin
  Result              := Self;
  FNextResponsibility := AValue;
end;

procedure TModelUsuarioTipoDeUsuarioFiscal.PedirSenha;
begin
  FOperacoes
    .PedirSenha
      .SetTitle('Entre com a senha de FISCAL')
      .SetTextConfirm('Confirmar')
      .SetTextCancel('Cancelar')
      .SetChamada(tuFiscal)
    .&End;
end;

function TModelUsuarioTipoDeUsuarioFiscal.Sangria: iModelUsuarioMetodos;
begin
  Result := Self;
  PedirSenha;
end;

function TModelUsuarioTipoDeUsuarioFiscal.SetOperacoes(
  AOperacoes: iControllerUsuarioOperacoes): iModelUsuarioMetodos;
begin
  Result     := Self;
  FOperacoes := AOperacoes;
end;

function TModelUsuarioTipoDeUsuarioFiscal.Suprimento: iModelUsuarioMetodos;
begin
  Result := Self;
  PedirSenha;
end;

end.
