unit MFichas.Model.Entidade.VENDAPAGAMENTOS;

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
  [Table('VENDAPAGAMENTOS', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave prim�ria')]
  TVENDAPAGAMENTOS = class
  private
    { Private declarations } 
    FGUUID: String;
    FVENDA: String;
    FTIPO: Integer;
    FVALOR: Double;
    FPARCELAS: Integer;
    FBANDEIRA: Integer;
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

    [Column('VENDA', ftString, 38)]
    [Dictionary('VENDA', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property VENDA: String read FVENDA write FVENDA;

    [Column('TIPO', ftInteger)]
    [Dictionary('TIPO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property TIPO: Integer read FTIPO write FTIPO;

    [Column('VALOR', ftBCD, 18, 4)]
    [Dictionary('VALOR', 'Mensagem de valida��o', '0', '', '', taRightJustify)]
    property VALOR: Double read FVALOR write FVALOR;

    [Column('PARCELAS', ftInteger)]
    [Dictionary('PARCELAS', 'Mensagem de valida��o', '', '', '', taCenter)]
    property PARCELAS: Integer read FPARCELAS write FPARCELAS;

    [Column('BANDEIRA', ftInteger)]
    [Dictionary('BANDEIRA', 'Mensagem de valida��o', '', '', '', taCenter)]
    property BANDEIRA: Integer read FBANDEIRA write FBANDEIRA;

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

{ TVENDAPAGAMENTOS }

function TVENDAPAGAMENTOS.GetDATAALTERACAO: TDateTime;
begin
  FDATAALTERACAO := Now;
  Result         := FDATAALTERACAO;
end;

function TVENDAPAGAMENTOS.GetDATACADASTRO: TDateTime;
begin
  if FDATACADASTRO = StrToDateTime('30/12/1899') then
    FDATACADASTRO := Now;
  Result := FDATACADASTRO;
end;

function TVENDAPAGAMENTOS.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization

  TRegisterClass.RegisterEntity(TVENDAPAGAMENTOS)

end.
