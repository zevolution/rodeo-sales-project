unit MFichas.Model.Entidade.GRUPOPRODUTO;

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
  [Table('GRUPOPRODUTO', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave prim�ria')]
  TGRUPOPRODUTO = class
  private
    { Private declarations } 
    FGUUID: String;
    FDESCRICAO: String;
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

    [Column('DESCRICAO', ftString, 128)]
    [Dictionary('DESCRICAO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property DESCRICAO: String read FDESCRICAO write FDESCRICAO;

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

{ TGRUPOPRODUTO }

function TGRUPOPRODUTO.GetDATAALTERACAO: TDateTime;
begin
  FDATAALTERACAO := Now;
  Result         := FDATAALTERACAO;
end;

function TGRUPOPRODUTO.GetDATACADASTRO: TDateTime;
begin
  if FDATACADASTRO = StrToDateTime('30/12/1899') then
    FDATACADASTRO := Now;
  Result := FDATACADASTRO;
end;

function TGRUPOPRODUTO.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization

  TRegisterClass.RegisterEntity(TGRUPOPRODUTO)

end.
