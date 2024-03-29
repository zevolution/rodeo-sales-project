unit MFichas.Model.Entidade.CAIXAOPERACOES;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  ormbr.types.blob, 
  ormbr.types.lazy, 
  ormbr.types.mapping, 
  ormbr.types.nullable, 
  ormbr.mapping.classes, 
  ormbr.mapping.register, 
  ormbr.mapping.attributes; 

type
  [Entity]
  [Table('CAIXAOPERACOES', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave prim�ria')]
  TCAIXAOPERACOES = class
  private
    { Private declarations } 
    FGUUID: String;
    FCAIXA: String;
    FTIPO: Integer;
    FVALOR: Double;
    FOPERADOR: String;
    FSTATUS: Integer;
    FDATACADASTRO: TDateTime;
    FDATAALTERACAO: TDateTime;
    function GetDATAALTERACAO: TDateTime;
    function GetDATACADASTRO: TDateTime;
    function GetGUUID: String;
  public 
    { Public declarations } 
    [Column('GUUID', ftString, 38)]
    [Dictionary('GUUID', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property GUUID: String read GetGUUID write FGUUID;

    [Column('CAIXA', ftString, 38)]
    [Dictionary('CAIXA', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property CAIXA: String read FCAIXA write FCAIXA;

    [Column('TIPO', ftInteger)]
    [Dictionary('TIPO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property TIPO: Integer read FTIPO write FTIPO;

    [Column('VALOR', ftBCD, 18, 4)]
    [Dictionary('VALOR', 'Mensagem de valida��o', '0', '', '', taRightJustify)]
    property VALOR: Double read FVALOR write FVALOR;

    [Column('OPERADOR', ftString, 38)]
    [Dictionary('OPERADOR', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property OPERADOR: String read FOPERADOR write FOPERADOR;

    [Column('STATUS', ftInteger)]
    [Dictionary('STATUS', 'Mensagem de valida��o', '', '', '', taCenter)]
    property STATUS: Integer read FSTATUS write FSTATUS;

    [Column('DATACADASTRO', ftDateTime)]
    [Dictionary('DATACADASTRO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property DATACADASTRO: TDateTime read GetDATACADASTRO write FDATACADASTRO;

    [Column('DATAALTERACAO', ftDateTime)]
    [Dictionary('DATAALTERACAO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property DATAALTERACAO: TDateTime read GetDATAALTERACAO write FDATAALTERACAO;
  end;

implementation

{ TCAIXAOPERACOES }

function TCAIXAOPERACOES.GetDATAALTERACAO: TDateTime;
begin
  FDATAALTERACAO := Now;
  Result         := FDATAALTERACAO;
end;

function TCAIXAOPERACOES.GetDATACADASTRO: TDateTime;
begin
  if FDATACADASTRO = StrToDateTime('30/12/1899') then
    FDATACADASTRO := Now;
  Result := FDATACADASTRO;
end;

function TCAIXAOPERACOES.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization

  TRegisterClass.RegisterEntity(TCAIXAOPERACOES)

end.
