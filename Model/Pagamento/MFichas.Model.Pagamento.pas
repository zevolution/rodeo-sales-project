unit MFichas.Model.Pagamento;

interface

uses
  MFichas.Model.Venda.Interfaces,
  MFichas.Model.Pagamento.Interfaces,
  MFichas.Model.Pagamento.Formas.Factory,
  MFichas.Model.Entidade.VENDAPAGAMENTOS,
  MFichas.Model.Conexao.Factory,
  MFichas.Model.Conexao.Interfaces,
  MFichas.Model.Entidade.VENDA,

  ORMBR.Container.ObjectSet,
  ORMBR.Container.ObjectSet.Interfaces;

type
  TModelPagamento = class(TInterfacedObject, iModelPagamento)
  private
    [weak]
    FParent: iModelVenda;
    FConn  : iModelConexaoSQL;
    FDAO   : iContainerObjectSet<TVENDAPAGAMENTOS>;
    constructor Create(AParent: iModelVenda);
  public
    destructor Destroy; override;
    class function New(AParent: iModelVenda): iModelPagamento;
    function Dinheiro       : iModelPagamentoMetodos;
    function CartaoDeDebito : iModelPagamentoMetodos;
    function CartaoDeCredito: iModelPagamentoMetodos;
    function MetodoDePagamento: iModelPagamentoMetodos;
    function DAO            : iContainerObjectSet<TVENDAPAGAMENTOS>;
    function EntidadeDeVenda: TVENDA;
  end;

implementation

{ TModelPagamento }

function TModelPagamento.CartaoDeCredito: iModelPagamentoMetodos;
begin
  Result := TModelPagamentoFormasFactory.New.CartaoCredito(Self);
end;

function TModelPagamento.CartaoDeDebito: iModelPagamentoMetodos;
begin
   Result := TModelPagamentoFormasFactory.New.CartaoDebito(Self);
end;

constructor TModelPagamento.Create(AParent: iModelVenda);
begin
  FParent := AParent;
  FConn   := TModelConexaoFactory.New.ConexaoSQL;
  FDAO    := TContainerObjectSet<TVENDAPAGAMENTOS>.Create(FConn.Conn, 10);
end;

function TModelPagamento.DAO: iContainerObjectSet<TVENDAPAGAMENTOS>;
begin
  Result := FDAO;
end;

destructor TModelPagamento.Destroy;
begin

  inherited;
end;

function TModelPagamento.Dinheiro: iModelPagamentoMetodos;
begin
  Result := TModelPagamentoFormasFactory.New.Dinheiro(Self);
end;

function TModelPagamento.EntidadeDeVenda: TVENDA;
begin
  Result := FParent.Entidade;
end;

function TModelPagamento.MetodoDePagamento: iModelPagamentoMetodos;
begin

end;

class function TModelPagamento.New(AParent: iModelVenda): iModelPagamento;
begin
  Result := Self.Create(AParent);
end;

end.
