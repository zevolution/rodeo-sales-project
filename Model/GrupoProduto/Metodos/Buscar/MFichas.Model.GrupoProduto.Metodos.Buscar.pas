unit MFichas.Model.GrupoProduto.Metodos.Buscar;

interface

uses
  System.SysUtils,

  MFichas.Model.GrupoProduto.Interfaces,

  MFichas.Controller.Types,

  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TModelGrupoProdutoMetodosBuscar = class(TInterfacedObject, iModelGrupoProdutoMetodosBuscar)
  private
    [weak]
    FParent    : iModelGrupoProduto;
    FFDMemTable: TFDMemTable;
    constructor Create(AParent: iModelGrupoProduto);
    procedure Validacao;
    procedure CopiarDataSet;
  public
    destructor Destroy; override;
    class function New(AParent: iModelGrupoProduto): iModelGrupoProdutoMetodosBuscar;
    function FDMemTable(AFDMemTable: TFDMemTable): iModelGrupoProdutoMetodosBuscar;
    function BuscarTodos                         : iModelGrupoProdutoMetodosBuscar;
    function BuscarTodosAtivos                   : iModelGrupoProdutoMetodosBuscar;
    function &End                                : iModelGrupoProdutoMetodos;
  end;

implementation

{ TModelGrupoProdutoMetodosBuscar }

function TModelGrupoProdutoMetodosBuscar.BuscarTodos: iModelGrupoProdutoMetodosBuscar;
begin
  //TODO: IMPLEMENTAR M�TODO DE BUSCA DE GRUPOS
  Result := Self;
  FParent.DAODataSet.Open;
  Validacao;
  CopiarDataSet;
end;

function TModelGrupoProdutoMetodosBuscar.&End: iModelGrupoProdutoMetodos;
begin
  Result := FParent.Metodos;
end;

procedure TModelGrupoProdutoMetodosBuscar.CopiarDataSet;
begin
  FFDMemTable.CopyDataSet(FParent.DAODataSet.DataSet, [coStructure, coRestart, coAppend]);
  FFDMemTable.IndexFieldNames := 'DESCRICAO';
end;

procedure TModelGrupoProdutoMetodosBuscar.Validacao;
begin
  if not Assigned(FFDMemTable) then
    raise Exception.Create(
      'Para prosseguir, voc� deve vincular um FDMemTable ao encadeamento' +
      ' de func�es do m�todo de GrupoProduto.Metodos.Buscar .'
    );
end;

function TModelGrupoProdutoMetodosBuscar.FDMemTable(
  AFDMemTable: TFDMemTable): iModelGrupoProdutoMetodosBuscar;
begin
  Result      := Self;
  FFDMemTable := AFDMemTable;
end;

function TModelGrupoProdutoMetodosBuscar.BuscarTodosAtivos: iModelGrupoProdutoMetodosBuscar;
begin
  Result := Self;
  FParent.DAODataSet.OpenWhere(
    ' STATUS = ' + Integer(saiAtivo).ToString
  );
  Validacao;
  CopiarDataSet;
end;

constructor TModelGrupoProdutoMetodosBuscar.Create(AParent: iModelGrupoProduto);
begin
  FParent := AParent;
end;

destructor TModelGrupoProdutoMetodosBuscar.Destroy;
begin

  inherited;
end;

class function TModelGrupoProdutoMetodosBuscar.New(AParent: iModelGrupoProduto): iModelGrupoProdutoMetodosBuscar;
begin
  Result := Self.Create(AParent);
end;

end.

