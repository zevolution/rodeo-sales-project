unit MFichas.Model.Usuario.Funcoes.Buscar;

interface

uses
  System.SysUtils,

  MFichas.Model.Usuario.Interfaces,

  MFichas.Controller.Types,

  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TModelUsuarioFuncoesBuscar = class(TInterfacedObject, iModelUsuarioFuncoesBuscar)
  private
    [weak]
    FParent    : iModelUsuario;
    FFDMemTable: TFDMemTable;
    constructor Create(AParent: iModelUsuario);
    procedure CopiarDataSet;
    procedure Validacao;
  public
    destructor Destroy; override;
    class function New(AParent: iModelUsuario): iModelUsuarioFuncoesBuscar;
    function FDMemTable(AFDMemTable: TFDMemTable): iModelUsuarioFuncoesBuscar;
    function BuscarTodos                         : iModelUsuarioFuncoesBuscar;
    function BuscarTodosAtivos                   : iModelUsuarioFuncoesBuscar;
    function BuscarCaixas                        : iModelUsuarioFuncoesBuscar;
    function BuscarFiscais                       : iModelUsuarioFuncoesBuscar;
    function BuscarProprietarios                 : iModelUsuarioFuncoesBuscar;
    function BuscarPorCodigo(AGUUID: String)     : iModelUsuarioFuncoesBuscar;
    function &End                                : iModelUsuarioFuncoes;
  end;

implementation

{ TModelUsuarioFuncoesBuscar }

function TModelUsuarioFuncoesBuscar.BuscarCaixas: iModelUsuarioFuncoesBuscar;
begin
  Result := Self;
  FParent.DAODataSet.OpenWhere(
    ' STATUS = ' + Integer(saiAtivo).ToString + ' AND ' +
    ' TIPO   = ' + Integer(tuCaixa).ToString
  );
  Validacao;
  CopiarDataSet;
end;

function TModelUsuarioFuncoesBuscar.BuscarFiscais: iModelUsuarioFuncoesBuscar;
begin
  Result := Self;
  FParent.DAODataSet.OpenWhere(
    ' STATUS =  ' + Integer(saiAtivo).ToString + ' AND ' +
    ' TIPO   >= ' + Integer(tuFiscal).ToString
  );
  Validacao;
  CopiarDataSet;
end;

function TModelUsuarioFuncoesBuscar.BuscarPorCodigo(AGUUID: String): iModelUsuarioFuncoesBuscar;
begin
  Result := Self;
  FParent.DAODataSet.OpenWhere(
    ' GUUID  = ' + QuotedStr(AGUUID)          + ' AND ' +
    ' STATUS = ' + Integer(saiAtivo).ToString + ' AND ' +
    ' TIPO   < ' + Integer(tuGerente).ToString
  );
  Validacao;
  CopiarDataSet;
end;

function TModelUsuarioFuncoesBuscar.BuscarProprietarios: iModelUsuarioFuncoesBuscar;
begin
  Result := Self;
  FParent.DAODataSet.OpenWhere(
    ' STATUS = ' + Integer(saiAtivo).ToString + ' AND ' +
    ' TIPO   = ' + Integer(tuGerente).ToString
  );
  Validacao;
  CopiarDataSet;
end;

function TModelUsuarioFuncoesBuscar.BuscarTodos: iModelUsuarioFuncoesBuscar;
begin
  Result := Self;
  FParent.DAODataSet.OpenWhere(
    ' TIPO < 2'
  );
  Validacao;
  CopiarDataSet;
end;

function TModelUsuarioFuncoesBuscar.BuscarTodosAtivos: iModelUsuarioFuncoesBuscar;
begin
  Result := Self;
  FParent.DAODataSet.OpenWhere(
    ' STATUS = ' + Integer(saiAtivo).ToString + ' AND ' +
    ' TIPO < 2'
  );
  Validacao;
  CopiarDataSet;
end;

function TModelUsuarioFuncoesBuscar.&End: iModelUsuarioFuncoes;
begin
  Result := FParent.Funcoes;
end;

function TModelUsuarioFuncoesBuscar.FDMemTable(
  AFDMemTable: TFDMemTable): iModelUsuarioFuncoesBuscar;
begin
  Result      := Self;
  FFDMemTable := AFDMemTable;
end;

procedure TModelUsuarioFuncoesBuscar.CopiarDataSet;
begin
  FFDMemTable.CopyDataSet(FParent.DAODataSet.DataSet, [coStructure, coRestart, coAppend]);
  FFDMemTable.IndexFieldNames := 'NOME';
end;

constructor TModelUsuarioFuncoesBuscar.Create(AParent: iModelUsuario);
begin
  FParent := AParent;
end;

destructor TModelUsuarioFuncoesBuscar.Destroy;
begin

  inherited;
end;

class function TModelUsuarioFuncoesBuscar.New(AParent: iModelUsuario): iModelUsuarioFuncoesBuscar;
begin
  Result := Self.Create(AParent);
end;

procedure TModelUsuarioFuncoesBuscar.Validacao;
begin
  if not Assigned(FFDMemTable) then
    raise Exception.Create(
      'Para prosseguir, voc� deve vincular um FDMemTable ao encadeamento' +
      ' de func�es do m�todo de Usuarios.Funcoes.Buscar .'
    );
end;

end.
