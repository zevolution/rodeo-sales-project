unit MFichas.Model.Permissoes.Metodos.Lista;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  MFichas.Model.Entidade.USUARIOPERMISSOES,
  MFichas.Model.Permissoes.Interfaces,

  MFichas.Controller.Types;

type
  TModelPermissoesMetodosLista = class(TInterfacedObject, iModelPermissoesLista)
  private
    [weak]
    FParent: iModelPermissoes;
    var FList  : TDictionary<String, TTypeTipoUsuario>;
    constructor Create(AParent: iModelPermissoes; var AList: TDictionary<String, TTypeTipoUsuario>);
  public
    destructor Destroy; override;
    class function New(AParent: iModelPermissoes; var AList: TDictionary<String, TTypeTipoUsuario>): iModelPermissoesLista;
    function AbrirCaixa                 : Integer;
    function FecharCaixa                : Integer;
    function Suprimento                 : Integer;
    function Sangria                    : Integer;
    function CadastrarProdutos          : Integer;
    function CadastrarGrupos            : Integer;
    function CadastrarUsuarios          : Integer;
    function AcessarRelatorios          : Integer;
    function AcessarConfiguracoes       : Integer;
    function ExcluirProdutosPosImpressao: Integer;
    function &End                       : iModelPermissoes;
  end;

implementation

{ TModelPermissoesMetodosLista }

function TModelPermissoesMetodosLista.AbrirCaixa: Integer;
begin
  Result := Integer(FList.Items['ABRIRCAIXA']);
end;

function TModelPermissoesMetodosLista.AcessarConfiguracoes: Integer;
begin
  Result := Integer(FList.Items['ACESSARCONFIGURACOES']);
end;

function TModelPermissoesMetodosLista.AcessarRelatorios: Integer;
begin
  Result := Integer(FList.Items['ACESSARRELATORIOS']);
end;

function TModelPermissoesMetodosLista.CadastrarGrupos: Integer;
begin
  Result := Integer(FList.Items['CADASTRARGRUPOS']);
end;

function TModelPermissoesMetodosLista.CadastrarProdutos: Integer;
begin
  Result := Integer(FList.Items['CADASTRARPRODUTOS']);
end;

function TModelPermissoesMetodosLista.CadastrarUsuarios: Integer;
begin
  Result := Integer(FList.Items['CADASTRARUSUARIOS']);
end;

function TModelPermissoesMetodosLista.&End: iModelPermissoes;
begin
  Result := FParent;
end;

constructor TModelPermissoesMetodosLista.Create(AParent: iModelPermissoes; var AList: TDictionary<String, TTypeTipoUsuario>);
begin
  FParent := AParent;
  FList   := AList;
end;

destructor TModelPermissoesMetodosLista.Destroy;
begin

  inherited;
end;

function TModelPermissoesMetodosLista.ExcluirProdutosPosImpressao: Integer;
begin
  Result := Integer(FList.Items['EXCLUIRPRODUTOS']);
end;

function TModelPermissoesMetodosLista.FecharCaixa: Integer;
begin
  Result := Integer(FList.Items['FECHARCAIXA']);
end;

class function TModelPermissoesMetodosLista.New(AParent: iModelPermissoes; var AList: TDictionary<String, TTypeTipoUsuario>): iModelPermissoesLista;
begin
  Result := Self.Create(AParent, AList);
end;

function TModelPermissoesMetodosLista.Sangria: Integer;
begin
  Result := Integer(FList.Items['SANGRIACAIXA']);
end;

function TModelPermissoesMetodosLista.Suprimento: Integer;
begin
  Result := Integer(FList.Items['SUPRIMENTOCAIXA']);
end;

end.
