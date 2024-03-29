unit MFichas.Controller.Venda.Metodos.Pagamento;

interface

uses
  System.SysUtils,

  MFichas.Controller.Venda.Interfaces,
  MFichas.Controller.Types,

  MFichas.Model.Venda.Interfaces,
  MFichas.Model.Pagamento.Interfaces;

type
  TControllerVendaMetodosPagar = class(TInterfacedObject, iControllerVendaMetodosPagar)
  private
    [weak]
    FParent            : iControllerVenda;
    FModel             : iModelVenda;
    FTipoVenda         : TTypeTipoVenda;
    FMetodoPagamento   : iModelPagamentoMetodos;
    FValorTotalDaCompra: Currency;
    constructor Create(AParent: iControllerVenda; AModel: iModelVenda);
    procedure Validacao;
  public
    destructor Destroy; override;
    class function New(AParent: iControllerVenda; AModel: iModelVenda): iControllerVendaMetodosPagar;
    function TipoDePagamento(ATipo: TTypeTipoPagamento): iControllerVendaMetodosPagar;
    function TipoDaVenda(ATipo: TTypeTipoVenda)        : iControllerVendaMetodosPagar;
    function ValorTotalDaCompra(AValue: Currency)      : iControllerVendaMetodosPagar;
    function Executar                                  : iControllerVendaMetodosPagar;
    function &End                                      : iControllerVendaMetodos;
  end;

implementation

{ TControllerVendaMetodosPagar }

function TControllerVendaMetodosPagar.&End: iControllerVendaMetodos;
begin
  Result := FParent.Metodos;
end;

procedure TControllerVendaMetodosPagar.Validacao;
begin
  if not Assigned(FMetodoPagamento) then
    raise Exception.Create(
      'N�o � poss�vel executar o pagamento, sem um m�todo de pagamento.'
    );
end;

function TControllerVendaMetodosPagar.ValorTotalDaCompra(
  AValue: Currency): iControllerVendaMetodosPagar;
begin
  Result              := Self;
  if AValue <= 0 then
    raise Exception.Create(
      'O valor total desta compra n�o pode ser igual ou inferior a 0.'
    );
  FValorTotalDaCompra := AValue;
end;

constructor TControllerVendaMetodosPagar.Create(AParent: iControllerVenda; AModel: iModelVenda);
begin
  FParent := AParent;
  FModel  := AModel;
end;

destructor TControllerVendaMetodosPagar.Destroy;
begin

  inherited;
end;

function TControllerVendaMetodosPagar.Executar: iControllerVendaMetodosPagar;
begin
  Result := Self;
  Validacao;

  case FTipoVenda of
    tvVenda:     begin
                   FMetodoPagamento
                     .Processar
                      .SetValor(FValorTotalDaCompra)
                     .&End
                   .&End;
                 end;

    tvDevolucao: begin
                   FMetodoPagamento
                     .Estornar
                      .SetValor(FValorTotalDaCompra)
                     .&End
                   .&End;
                 end;
  end;
end;

class function TControllerVendaMetodosPagar.New(AParent: iControllerVenda; AModel: iModelVenda): iControllerVendaMetodosPagar;
begin
  Result := Self.Create(AParent, AModel);
end;

function TControllerVendaMetodosPagar.TipoDaVenda(
  ATipo: TTypeTipoVenda): iControllerVendaMetodosPagar;
begin
  Result     := Self;
  FTipoVenda := ATipo;
end;

function TControllerVendaMetodosPagar.TipoDePagamento(
  ATipo: TTypeTipoPagamento): iControllerVendaMetodosPagar;
begin
  Result := Self;
  case ATipo of
    tpDinheiro     : FMetodoPagamento := FModel.Pagamento.Dinheiro;
    tpCartaoDebito : FMetodoPagamento := FModel.Pagamento.CartaoDeDebito;
    tpCartaoCredito: FMetodoPagamento := FModel.Pagamento.CartaoDeCredito;
  end;
end;

end.
