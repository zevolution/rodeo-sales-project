unit MFichas.Model.Item.Metodos.Devolver;

interface

uses
  System.SysUtils,

  MFichas.Controller.Types,

  MFichas.Model.Item.Interfaces,
  MFichas.Model.Entidade.VENDAITENS,
  MFichas.Model.Venda.Interfaces;

type
  TModelItemMetodosDevolver = class(TInterfacedObject, iModelItemMetodosDevolver)
  private
    [weak]
    FParent    : iModelItem;
    FVenda     : iModelVenda;
    FCodigo    : String;
    FQuantidade: Double;
    FValor     : Currency;
    constructor Create(AParent: iModelItem; AVenda: iModelVenda);
    procedure Gravar;
  public
    destructor Destroy; override;
    class function New(AParent: iModelItem; AVenda: iModelVenda): iModelItemMetodosDevolver;
    function Codigo(ACodigo: String)         : iModelItemMetodosDevolver;
    function Quantidade(AQuantidade: Double) : iModelItemMetodosDevolver;
    function Valor(AValor: Currency)         : iModelItemMetodosDevolver;
    function &End                            : iModelItemMetodos;
  end;

implementation

{ TModelItemMetodosDevolver }

function TModelItemMetodosDevolver.Codigo(
  ACodigo: String): iModelItemMetodosDevolver;
begin
  Result  := Self;
  FCodigo := ACodigo;
end;

function TModelItemMetodosDevolver.&End: iModelItemMetodos;
begin
  //IMPLEMENTAR METODO DE DEVOLU�AO DE ITEM
  Result := FParent.Metodos;
  Gravar;
end;

procedure TModelItemMetodosDevolver.Gravar;
begin
  FParent.Entidade.VENDA      := FVenda.Entidade.GUUID;
  FParent.Entidade.PRODUTO    := FCodigo;
  FParent.Entidade.QUANTIDADE := FQuantidade;
  FParent.Entidade.PRECO      := FValor;
  FParent.Entidade.TIPO       := Integer(tvDevolucao);
end;

constructor TModelItemMetodosDevolver.Create(AParent: iModelItem; AVenda: iModelVenda);
begin
  FParent := AParent;
  FVenda  := AVenda;
end;

destructor TModelItemMetodosDevolver.Destroy;
begin

  inherited;
end;

class function TModelItemMetodosDevolver.New(AParent: iModelItem; AVenda: iModelVenda): iModelItemMetodosDevolver;
begin
  Result := Self.Create(AParent, AVenda);
end;

function TModelItemMetodosDevolver.Quantidade(
  AQuantidade: Double): iModelItemMetodosDevolver;
begin
  Result      := Self;
  FQuantidade := AQuantidade;
end;

function TModelItemMetodosDevolver.Valor(
  AValor: Currency): iModelItemMetodosDevolver;
begin
  Result := Self;
  FValor := AValor;
end;

end.
