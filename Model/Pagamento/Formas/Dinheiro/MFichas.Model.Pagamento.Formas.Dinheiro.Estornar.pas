unit MFichas.Model.Pagamento.Formas.Dinheiro.Estornar;

interface

uses
  System.SysUtils,

  MFichas.Model.Pagamento.Interfaces,
  MFichas.Model.Entidade.VENDAPAGAMENTOS,

  MFichas.Controller.Types;

type
  TModelPagamentoFormasDinheiroEstornar = class(TInterfacedObject, iModelPagamentoMetodosEstornar)
  private
    [weak]
    FParent: iModelPagamento;
    FValor : Currency;
    FEntidade: TVENDAPAGAMENTOS;
    constructor Create(AParent: iModelPagamento);
    procedure Gravar;
  public
    destructor Destroy; override;
    class function New(AParent: iModelPagamento): iModelPagamentoMetodosEstornar;
    function SetValor(AValue: Currency): iModelPagamentoMetodosEstornar;
    function &End                      : iModelPagamentoMetodos;
  end;

implementation

{ TModelPagamentoFormasDinheiroEstornar }

function TModelPagamentoFormasDinheiroEstornar.&End: iModelPagamentoMetodos;
begin
  //TODO: IMPLEMENTAR METODO DE ESTORNO EM DINHEIRO
  Result := FParent.Dinheiro;
  Gravar;
end;

procedure TModelPagamentoFormasDinheiroEstornar.Gravar;
begin
  FEntidade.VENDA  := FParent.EntidadeDeVenda.GUUID;
  FEntidade.TIPO   := Integer(tpDinheiro);
  FEntidade.VALOR  := FValor;
  FEntidade.STATUS := Integer(spEstornado);
  FParent.DAO.Insert(FEntidade);
end;

constructor TModelPagamentoFormasDinheiroEstornar.Create(AParent: iModelPagamento);
begin
  FParent   := AParent;
  FEntidade := TVENDAPAGAMENTOS.Create;
end;

destructor TModelPagamentoFormasDinheiroEstornar.Destroy;
begin
  {$IFDEF MSWINDOWS}
  FreeAndNil(FEntidade);
  {$ELSE}
  FEntidade.Free;
  FEntidade.DisposeOf;
  {$ENDIF}
  inherited;
end;

class function TModelPagamentoFormasDinheiroEstornar.New(AParent: iModelPagamento): iModelPagamentoMetodosEstornar;
begin
  Result := Self.Create(AParent);
end;

function TModelPagamentoFormasDinheiroEstornar.SetValor(
  AValue: Currency): iModelPagamentoMetodosEstornar;
begin
  Result := Self;
  FValor := AValue;
end;

end.
