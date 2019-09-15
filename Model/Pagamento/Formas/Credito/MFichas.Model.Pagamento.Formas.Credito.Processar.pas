unit MFichas.Model.Pagamento.Formas.Credito.Processar;

interface

uses
  System.SysUtils,

  MFichas.Model.Pagamento.Interfaces,
  MFichas.Model.Entidade.VENDAPAGAMENTOS,

  MFichas.Controller.Types;

type
  TModelPagamentoFormasCreditoProcessar = class(TInterfacedObject, iModelPagamentoMetodosProcessar)
  private
    [weak]
    FParent  : iModelPagamento;
    FValor   : Currency;
    FEntidade: TVENDAPAGAMENTOS;
    constructor Create(AParent: iModelPagamento);
    procedure Gravar;
  public
    destructor Destroy; override;
    class function New(AParent: iModelPagamento): iModelPagamentoMetodosProcessar;
    function SetValor(AValue: Currency): iModelPagamentoMetodosProcessar;
    function &End                      : iModelPagamentoMetodos;
  end;

implementation

{ TModelPagamentoFormasCreditoProcessar }

function TModelPagamentoFormasCreditoProcessar.&End: iModelPagamentoMetodos;
begin
  //TODO: IMPLEMENTAR METODO DE PAGAMENTO EM CR�DITO.
  Result           := FParent.CartaoDeCredito;
  Gravar;
end;

procedure TModelPagamentoFormasCreditoProcessar.Gravar;
begin
  FEntidade.VENDA  := FParent.EntidadeDeVenda.GUUID;
  FEntidade.TIPO   := Integer(tpCartaoCredito);
  FEntidade.VALOR  := FValor;
  FEntidade.STATUS := Integer(spProcessado);
  FParent.DAO.Insert(FEntidade);
end;

constructor TModelPagamentoFormasCreditoProcessar.Create(AParent: iModelPagamento);
begin
  FParent   := AParent;
  FEntidade := TVENDAPAGAMENTOS.Create;
end;

destructor TModelPagamentoFormasCreditoProcessar.Destroy;
begin
  {$IFDEF MSWINDOWS}
  FreeAndNil(FEntidade);
  {$ELSE}
  FEntidade.Free;
  FEntidade.DisposeOf;
  {$ENDIF}
  inherited;
end;

class function TModelPagamentoFormasCreditoProcessar.New(AParent: iModelPagamento): iModelPagamentoMetodosProcessar;
begin
  Result := Self.Create(AParent);
end;

function TModelPagamentoFormasCreditoProcessar.SetValor(
  AValue: Currency): iModelPagamentoMetodosProcessar;
begin
  Result := Self;
  FValor := AValue;
end;

end.
