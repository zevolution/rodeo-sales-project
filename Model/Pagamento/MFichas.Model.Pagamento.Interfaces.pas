unit MFichas.Model.Pagamento.Interfaces;

interface

uses
  MFichas.Model.Entidade.VENDAPAGAMENTOS,
  MFichas.Model.Entidade.VENDA,

  ORMBR.Container.ObjectSet.Interfaces;

type
  iModelPagamento                 = interface;
  iModelPagamentoMetodos          = interface;
  iModelPagamentoMetodosProcessar = interface;
  iModelPagamentoMetodosEstornar  = interface;

  iModelPagamento = interface
    ['{ACB3004A-9D8D-4F6F-B6D0-50CC3674C34D}']
    function Dinheiro       : iModelPagamentoMetodos;
    function CartaoDeDebito : iModelPagamentoMetodos;
    function CartaoDeCredito: iModelPagamentoMetodos;
    function DAO            : iContainerObjectSet<TVENDAPAGAMENTOS>;
    function EntidadeDeVenda: TVENDA;
  end;

  iModelPagamentoMetodos = interface
    ['{9A230FEB-97DC-4F2E-B9B6-3DAFCDE5EE98}']
    function Processar: iModelPagamentoMetodosProcessar;
    function Estornar : iModelPagamentoMetodosEstornar;
    function &End     : iModelPagamento;
  end;

  iModelPagamentoMetodosProcessar = interface
    ['{97CF1411-282E-4D57-BD30-26BC69C64064}']
    function SetValor(AValue: Currency): iModelPagamentoMetodosProcessar;
    function &End                      : iModelPagamentoMetodos;
  end;

  iModelPagamentoMetodosEstornar = interface
    ['{97CF1411-282E-4D57-BD30-26BC69C64064}']
    function SetValor(AValue: Currency): iModelPagamentoMetodosEstornar;
    function &End                      : iModelPagamentoMetodos;
  end;
  {
    FPagamento
    .Metodos
    .Dinheiro
      .Executar
        SetValor()
      .&End
    .&End
    .CartaoDeCredito
      .Executar
        .SetValor()
      .&End
    .&End
    .CartaoDeDebito
      .Executar
        .SetValor()
      .&End
    .&End
  }


implementation

end.
