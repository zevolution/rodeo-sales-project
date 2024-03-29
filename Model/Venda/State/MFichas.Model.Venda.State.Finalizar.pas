unit MFichas.Model.Venda.State.Finalizar;

interface

uses
  System.SysUtils,

  MFichas.Model.Venda.Interfaces;

type
  TModelVendaStateFinalizar = class(TInterfacedObject, iModelVendaMetodos)
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

{ TModelVendaStateFinalizar }

function TModelVendaStateFinalizar.&End: iModelVenda;
begin

end;

function TModelVendaStateFinalizar.Abrir: iModelVendaMetodosAbrir;
begin

end;

constructor TModelVendaStateFinalizar.Create;
begin

end;

destructor TModelVendaStateFinalizar.Destroy;
begin

  inherited;
end;

function TModelVendaStateFinalizar.Finalizar: iModelVendaMetodosFinalizar;
begin
  raise Exception.Create(
    'N�o � poss�vel usar o m�todo de finaliza��o de venda.' + sLineBreak +
    'N�o existe nenhuma venda aberta para ser finalizada.'
  );
end;

class function TModelVendaStateFinalizar.New: iModelVendaMetodos;
begin
  Result := Self.Create;
end;

function TModelVendaStateFinalizar.Pagar: iModelVendaMetodosPagar;
begin
  raise Exception.Create(
    'N�o � poss�vel adicionar um pagamento.' + sLineBreak +
    'N�o existe nenhuma venda em aberto.'
  );
end;

end.
