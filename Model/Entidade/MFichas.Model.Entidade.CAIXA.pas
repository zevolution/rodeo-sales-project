unit MFichas.Model.Entidade.CAIXA;

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
  ormbr.mapping.attributes,

  MFichas.Model.Entidade.CAIXAOPERACOES;

type
  [Entity]
  [Table('CAIXA', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave prim�ria')]
  TCAIXA = class
  private
    { Private declarations } 
    FGUUID: String;
    FOPERADOR: String;
    FSTATUS: Integer;
    FDATAABERTURA: TDateTime;
    FDATAFECHAMENTO: TDateTime;
    FDATAALTERACAO: TDateTime;
    FVALORABERTURA: Double;
    FVALORFECHAMENTO: Double;
    FOPERACOES: Lazy<TObjectList<TCAIXAOPERACOES>>;
    function GetDATAABERTURA: TDateTime;
    function GetDATAALTERACAO: TDateTime;
    function GetDATAFECHAMENTO: TDateTime;
    function GetGUUID: String;
    procedure SetDATAALTERACAO(const Value: TDateTime);
    function GetOPERACOES: TObjectList<TCAIXAOPERACOES>;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;

    [Column('GUUID', ftString, 38)]
    [Dictionary('GUUID', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property GUUID: String read GetGUUID write FGUUID;

    [Column('OPERADOR', ftString, 38)]
    [Dictionary('OPERADOR', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property OPERADOR: String read FOPERADOR write FOPERADOR;

    [Column('STATUS', ftInteger)]
    [Dictionary('STATUS', 'Mensagem de valida��o', '', '', '', taCenter)]
    property STATUS: Integer read FSTATUS write FSTATUS;

    [Column('DATAABERTURA', ftDateTime)]
    [Dictionary('DATAABERTURA', 'Mensagem de valida��o', '', '', '', taCenter)]
    property DATAABERTURA: TDateTime read GetDATAABERTURA write FDATAABERTURA;

    [Column('DATAFECHAMENTO', ftDateTime)]
    [Dictionary('DATAFECHAMENTO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property DATAFECHAMENTO: TDateTime read GetDATAFECHAMENTO write FDATAFECHAMENTO;

    [Column('DATAALTERACAO', ftDateTime)]
    [Dictionary('DATAALTERACAO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property DATAALTERACAO: TDateTime read GetDATAALTERACAO write SetDATAALTERACAO;

    [Column('VALORABERTURA', ftBCD, 18, 4)]
    [Dictionary('VALORABERTURA', 'Mensagem de valida��o', '0', '', '', taRightJustify)]
    property VALORABERTURA: Double read FVALORABERTURA write FVALORABERTURA;

    [Column('VALORFECHAMENTO', ftBCD, 18, 4)]
    [Dictionary('VALORFECHAMENTO', 'Mensagem de valida��o', '0', '', '', taRightJustify)]
    property VALORFECHAMENTO: Double read FVALORFECHAMENTO write FVALORFECHAMENTO;

    [Association(OneToMany, 'GUUID', 'CAIXAOPERACOES', 'CAIXA', True)]
    [CascadeActions([CascadeInsert, CascadeUpdate, CascadeDelete])]
    property OPERACOES: TObjectList<TCAIXAOPERACOES> read GetOPERACOES;
  end;

implementation

{ TCAIXA }

constructor TCAIXA.Create;
begin
end;

destructor TCAIXA.Destroy;
begin
  inherited;
end;

function TCAIXA.GetDATAABERTURA: TDateTime;
begin
  if FDATAABERTURA = StrToDateTime('30/12/1899') then
    FDATAABERTURA := Now;
  Result := FDATAABERTURA;
end;

function TCAIXA.GetDATAALTERACAO: TDateTime;
begin
  FDATAALTERACAO := StrToDateTime('30/12/1899');
  if FDATAALTERACAO = StrToDateTime('30/12/1899') then
    FDATAALTERACAO := Now;
  Result := FDATAALTERACAO;
end;

function TCAIXA.GetDATAFECHAMENTO: TDateTime;
begin
  if (FDATAFECHAMENTO = StrToDateTime('30/12/1899')) and (FSTATUS = 0) then
    FDATAFECHAMENTO := Now;
  Result := FDATAFECHAMENTO;
end;

function TCAIXA.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

function TCAIXA.GetOPERACOES: TObjectList<TCAIXAOPERACOES>;
begin
  Result := FOPERACOES.Value;
end;

procedure TCAIXA.SetDATAALTERACAO(const Value: TDateTime);
begin
  FDATAALTERACAO := Now;
end;

initialization

  TRegisterClass.RegisterEntity(TCAIXA)

end.
