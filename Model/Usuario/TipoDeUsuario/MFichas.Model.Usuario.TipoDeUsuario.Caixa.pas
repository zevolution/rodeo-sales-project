unit MFichas.Model.Usuario.TipoDeUsuario.Caixa;

interface

uses
  MFichas.Model.Usuario.Interfaces,
  MFichas.Controller.Usuario.Operacoes.Interfaces;

type
  TModelUsuarioTipoDeUsuarioCaixa = class(TInterfacedObject, iModelUsuarioMetodos)
  private
    [weak]
    FParent            : iModelUsuario;
    FNextResponsibility: iModelUsuarioMetodos;
    FOperacoes         : iControllerUsuarioOperacoes;
    constructor Create(AParent: iModelUsuario);
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

{ TModelUsuarioTipoDeUsuarioCaixa }

function TModelUsuarioTipoDeUsuarioCaixa.&End: iModelUsuario;
begin
  Result := FParent;
end;

function TModelUsuarioTipoDeUsuarioCaixa.AbrirCaixa: iModelUsuarioMetodos;
begin
  Result := Self;
  FNextResponsibility.AbrirCaixa;
end;

function TModelUsuarioTipoDeUsuarioCaixa.AcessarConfiguracoes: iModelUsuarioMetodos;
begin
  Result := Self;
end;

function TModelUsuarioTipoDeUsuarioCaixa.AcessarRelatorios: iModelUsuarioMetodos;
begin
  Result := Self;
end;

function TModelUsuarioTipoDeUsuarioCaixa.CadastrarGrupos: iModelUsuarioMetodos;
begin
  Result := Self;
end;

function TModelUsuarioTipoDeUsuarioCaixa.CadastrarProdutos: iModelUsuarioMetodos;
begin
  Result := Self;
end;

function TModelUsuarioTipoDeUsuarioCaixa.CadastrarUsuarios: iModelUsuarioMetodos;
begin
  Result := Self;
end;

constructor TModelUsuarioTipoDeUsuarioCaixa.Create(AParent: iModelUsuario);
begin
  FParent := AParent;
end;

destructor TModelUsuarioTipoDeUsuarioCaixa.Destroy;
begin

  inherited;
end;

function TModelUsuarioTipoDeUsuarioCaixa.ExcluirProdutosPosImpressao: iModelUsuarioMetodos;
begin
  Result := Self;
end;

function TModelUsuarioTipoDeUsuarioCaixa.FecharCaixa: iModelUsuarioMetodos;
begin
  Result := Self;
end;

function TModelUsuarioTipoDeUsuarioCaixa.LogoENomeDaFesta: iModelUsuarioMetodos;
begin
  Result := Self;
end;

class function TModelUsuarioTipoDeUsuarioCaixa.New(AParent: iModelUsuario): iModelUsuarioMetodos;
begin
  Result := Self.Create(AParent);
end;

function TModelUsuarioTipoDeUsuarioCaixa.NextReponsibility(
  AValue: iModelUsuarioMetodos): iModelUsuarioMetodos;
begin
  Result              := Self;
  FNextResponsibility := AValue;
end;

function TModelUsuarioTipoDeUsuarioCaixa.Sangria: iModelUsuarioMetodos;
begin
  Result := Self;
end;

function TModelUsuarioTipoDeUsuarioCaixa.SetOperacoes(
  AOperacoes: iControllerUsuarioOperacoes): iModelUsuarioMetodos;
begin
  Result     := Self;
  FOperacoes := AOperacoes;
end;

function TModelUsuarioTipoDeUsuarioCaixa.Suprimento: iModelUsuarioMetodos;
begin
  Result := Self;
end;

end.