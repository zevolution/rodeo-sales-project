unit MFichas.Model.Entidade.VENDAITENS;

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
  [Table('VENDAITENS', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave prim�ria')]
  TVENDAITENS = class
  private
    { Private declarations } 
    FGUUID: String;
    FVENDA: String;
    FPRODUTO: String;
    FQUANTIDADE: Double;
    FPRECO: Double;
    FSTATUS: Integer;
    FTIPO: Integer;
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

    [Column('VENDA', ftString, 38)]
    [Dictionary('VENDA', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property VENDA: String read FVENDA write FVENDA;

    [Column('PRODUTO', ftString, 38)]
    [Dictionary('PRODUTO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property PRODUTO: String read FPRODUTO write FPRODUTO;

    [Column('QUANTIDADE', ftBCD, 18, 4)]
    [Dictionary('QUANTIDADE', 'Mensagem de valida��o', '0', '', '', taRightJustify)]
    property QUANTIDADE: Double read FQUANTIDADE write FQUANTIDADE;

    [Column('PRECO', ftBCD, 18, 4)]
    [Dictionary('PRECO', 'Mensagem de valida��o', '0', '', '', taRightJustify)]
    property PRECO: Double read FPRECO write FPRECO;

    [Column('STATUS', ftInteger)]
    [Dictionary('STATUS', 'Mensagem de valida��o', '', '', '', taCenter)]
    property STATUS: Integer read FSTATUS write FSTATUS;

    [Column('TIPO', ftInteger)]
    [Dictionary('TIPO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property TIPO: Integer read FTIPO write FTIPO;

    [Column('DATACADASTRO', ftDateTime)]
    [Dictionary('DATACADASTRO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property DATACADASTRO: TDateTime read GetDATACADASTRO write FDATACADASTRO;

    [Column('DATAALTERACAO', ftDateTime)]
    [Dictionary('DATAALTERACAO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property DATAALTERACAO: TDateTime read GetDATAALTERACAO write FDATAALTERACAO;
  end;

implementation

{ TVENDAITENS }

function TVENDAITENS.GetDATAALTERACAO: TDateTime;
begin
  FDATAALTERACAO := Now;
  Result := FDATAALTERACAO;
end;

function TVENDAITENS.GetDATACADASTRO: TDateTime;
begin
  if FDATACADASTRO = StrToDateTime('30/12/1899') then
    FDATACADASTRO := Now;
  Result := FDATACADASTRO;
end;

function TVENDAITENS.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization

  TRegisterClass.RegisterEntity(TVENDAITENS)

end.
