unit MFichas.Model.Entidade.USUARIO;

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
  [Table('USUARIO', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave prim�ria')]
  TUSUARIO = class
  private
    { Private declarations } 
    FGUUID: String;
    FLOGIN: String;
    FNOME: String;
    FSENHA: String;
    FTIPO: Integer;
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

    [Column('LOGIN', ftString, 60)]
    [Dictionary('LOGIN', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property LOGIN: String read FLOGIN write FLOGIN;

    [Column('NOME', ftString, 60)]
    [Dictionary('NOME', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property NOME: String read FNOME write FNOME;

    [Column('SENHA', ftString, 50)]
    [Dictionary('SENHA', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property SENHA: String read FSENHA write FSENHA;

    [Column('TIPO', ftInteger)]
    [Dictionary('TIPO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property TIPO: Integer read FTIPO write FTIPO;

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

{ TUSUARIO }

function TUSUARIO.GetDATAALTERACAO: TDateTime;
begin
  FDATACADASTRO := Now;
  Result := FDATAALTERACAO;
end;

function TUSUARIO.GetDATACADASTRO: TDateTime;
begin
  if FDATACADASTRO = StrToDateTime('30/12/1899') then
    FDATACADASTRO := Now;
  Result := FDATACADASTRO;
end;

function TUSUARIO.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization

  TRegisterClass.RegisterEntity(TUSUARIO)

end.
