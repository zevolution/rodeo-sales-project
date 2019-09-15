unit MFichas.Model.Venda.Metodos.Pagar;

interface

uses
  MFichas.Model.Venda.Interfaces,
  MFichas.Model.Venda.State.Factory;

type
  TModelVendaMetodosPagar = class(TInterfacedObject, iModelVendaMetodosPagar)
  private
    [weak]
    FParent: iModelVenda;
    constructor Create(AParent: iModelVenda);
  public
    destructor Destroy; override;
    class function New(AParent: iModelVenda): iModelVendaMetodosPagar;
    function Executar: iModelVendaMetodosPagar;
    function &End    : iModelVendaMetodos;
  end;

implementation

{ TModelVendaMetodosPagar }

function TModelVendaMetodosPagar.&End: iModelVendaMetodos;
begin
  Result := FParent.Metodos;
end;

constructor TModelVendaMetodosPagar.Create(AParent: iModelVenda);
begin
  FParent := AParent;
end;

destructor TModelVendaMetodosPagar.Destroy;
begin

  inherited;
end;

function TModelVendaMetodosPagar.Executar: iModelVendaMetodosPagar;
begin
  //TODO: IMPLEMENTAR METODOS DE PAGAMENTO DA VENDA.
  Result := Self;
  FParent.SetState(TModelVendaStateFactory.New.Pagando);
end;

class function TModelVendaMetodosPagar.New(AParent: iModelVenda): iModelVendaMetodosPagar;
begin
  Result := Self.Create(AParent);
end;

end.
