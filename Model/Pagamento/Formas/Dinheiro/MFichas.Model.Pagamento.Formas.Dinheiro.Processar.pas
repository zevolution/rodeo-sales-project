unit MFichas.Model.Pagamento.Formas.Dinheiro.Processar;

interface

uses
  System.SysUtils,

  MFichas.Controller.Types,

  MFichas.Model.Pagamento.Interfaces,
  MFichas.Model.Entidade.VENDAPAGAMENTOS;

type
  TModelPagamentoFormasDinheiroProcessar = class(TInterfacedObject, iModelPagamentoMetodosProcessar)
  private
    [weak]
    FParent: iModelPagamento;
    FValor : Currency;
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

{ TModelPagamentoFormasDinheiroProcessar }

function TModelPagamentoFormasDinheiroProcessar.&End: iModelPagamentoMetodos;
begin
  //TODO: IMPLEMENTAR METODO DE PAGAMENTO EM DINHEIRO.
  Result := FParent.Dinheiro;
  Gravar;
end;

procedure TModelPagamentoFormasDinheiroProcessar.Gravar;
begin
  FEntidade.VENDA  := FParent.EntidadeDeVenda.GUUID;
  FEntidade.TIPO   := Integer(tpDinheiro);
  FEntidade.VALOR  := FValor;
  FEntidade.STATUS := Integer(spProcessado);
  FParent.DAO.Insert(FEntidade);
end;

constructor TModelPagamentoFormasDinheiroProcessar.Create(AParent: iModelPagamento);
begin
  FParent   := AParent;
  FEntidade := TVENDAPAGAMENTOS.Create;
end;

destructor TModelPagamentoFormasDinheiroProcessar.Destroy;
begin
  {$IFDEF MSWINDOWS}
  FreeAndNil(FEntidade);
  {$ELSE}
  FEntidade.Free;
  FEntidade.DisposeOf;
  {$ENDIF}
  inherited;
end;

class function TModelPagamentoFormasDinheiroProcessar.New(AParent: iModelPagamento): iModelPagamentoMetodosProcessar;
begin
  Result := Self.Create(AParent);
end;

function TModelPagamentoFormasDinheiroProcessar.SetValor(
  AValue: Currency): iModelPagamentoMetodosProcessar;
begin
  Result := Self;
  FValor := AValue;
end;

end.
