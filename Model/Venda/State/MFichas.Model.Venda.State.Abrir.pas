unit MFichas.Model.Venda.State.Abrir;

interface

uses
  System.SysUtils,

  MFichas.Model.Venda.Interfaces;

type
  TModelVendaStateAbrir = class(TInterfacedObject, iModelVendaMetodos)
  private
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iModelVendaMetodos;
    function Abrir    : iModelVendaMetodosAbrir;
    function Pagar    : iModelVendaMetodosPagar;
    function Finalizar: iModelVendaMetodosFinalizar;
    function &End     : iModelVenda;
  end;

implementation

{ TModelVendaStateAbrir }

function TModelVendaStateAbrir.&End: iModelVenda;
begin

end;

function TModelVendaStateAbrir.Abrir: iModelVendaMetodosAbrir;
begin
  raise Exception.Create(
    'Esta venda j� encontrasse aberta.'
  );
end;

constructor TModelVendaStateAbrir.Create;
begin

end;

destructor TModelVendaStateAbrir.Destroy;
begin

  inherited;
end;

function TModelVendaStateAbrir.Finalizar: iModelVendaMetodosFinalizar;
begin
  raise Exception.Create(
    'N�o � poss�vel finalizar esta venda.' + sLineBreak +
    'Para finalizar esta venda � preciso inserir a forma de pagamento.'
  );
end;

class function TModelVendaStateAbrir.New: iModelVendaMetodos;
begin
  Result := Self.Create;
end;

function TModelVendaStateAbrir.Pagar: iModelVendaMetodosPagar;
begin

end;

end.
