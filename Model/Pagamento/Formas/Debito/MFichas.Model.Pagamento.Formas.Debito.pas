unit MFichas.Model.Pagamento.Formas.Debito;

interface

uses
  System.SysUtils,

  MFichas.Model.Pagamento.Interfaces,
  MFichas.Model.Pagamento.Formas.Debito.Processar;

type
  TModelPagamentoFormasDebito = class(TInterfacedObject, iModelPagamentoMetodos)
  private
    [weak]
    FParent: iModelPagamento;
    constructor Create(AParent: iModelPagamento);
  public
    destructor Destroy; override;
    class function New(AParent: iModelPagamento): iModelPagamentoMetodos;
    function Processar: iModelPagamentoMetodosProcessar;
    function Estornar : iModelPagamentoMetodosEstornar;
    function &End     : iModelPagamento;
  end;

implementation

{ TModelPagamentoFormasDebito }

function TModelPagamentoFormasDebito.&End: iModelPagamento;
begin
  Result := FParent;
end;

constructor TModelPagamentoFormasDebito.Create(AParent: iModelPagamento);
begin
  FParent := AParent;
end;

destructor TModelPagamentoFormasDebito.Destroy;
begin

  inherited;
end;

function TModelPagamentoFormasDebito.Estornar: iModelPagamentoMetodosEstornar;
begin
  raise Exception.Create(
    'Este m�todo de pagamento ainda n�o est� validado no sistema.' + sLineBreak +
    'Por favor, utilize outro m�todo.'
  );
end;

class function TModelPagamentoFormasDebito.New(AParent: iModelPagamento): iModelPagamentoMetodos;
begin
  Result := Self.Create(AParent);
end;

function TModelPagamentoFormasDebito.Processar: iModelPagamentoMetodosProcessar;
begin
  Result := TModelPagamentoFormasDebitoProcessar.New(FParent);
end;

end.
