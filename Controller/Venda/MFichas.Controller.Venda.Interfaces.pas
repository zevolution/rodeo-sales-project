unit MFichas.Controller.Venda.Interfaces;

interface

uses MFichas.Controller.Types;

type
  iControllerVenda                    = interface;
  iControllerVendaMetodos             = interface;
  iControllerVendaMetodosPagar        = interface;
  iControllerVendaMetodosVenderItem   = interface;
  iControllerVendaMetodosCancelarItem = interface;
  iControllerVendaMetodosDevolverItem = interface;

  iControllerVenda = interface
    ['{8F4E8184-D2AD-433B-A544-8A9F33E4C61C}']
    function Metodos: iControllerVendaMetodos;
  end;

  iControllerVendaMetodos = interface
    ['{DC1C71F9-34FB-4184-B68F-B0C3CF99CD07}']
    function AbrirVenda      : iControllerVendaMetodos;
    function Pagar           : iControllerVendaMetodos;
    function FinalizarVenda  : iControllerVendaMetodos;
    function VenderItem      : iControllerVendaMetodosVenderItem;
    function CancelarItem    : iControllerVendaMetodosCancelarItem;
    function DevolverItem    : iControllerVendaMetodosDevolverItem;
    function EfetuarPagamento: iControllerVendaMetodosPagar;
  end;

  iControllerVendaMetodosPagar = interface
    ['{CBCDE655-62AB-44F5-95A3-1BEADB5E72AE}']
     function TipoDePagamento(ATipo: TTypeTipoPagamento): iControllerVendaMetodosPagar;
     function TipoDaVenda(ATipo: TTypeTipoVenda)        : iControllerVendaMetodosPagar;
     function ValorTotalDaCompra(AValue: Currency)      : iControllerVendaMetodosPagar;
     function Executar                                  : iControllerVendaMetodosPagar;
     function &End                                      : iControllerVendaMetodos;
  end;

  iControllerVendaMetodosVenderItem = interface
    ['{DEE9CD69-25BA-4298-AFA3-8A4B322FBDFF}']
    function Codigo(ACodigo: String)        : iControllerVendaMetodosVenderItem;
    function Quantidade(AQuantidade: Double): iControllerVendaMetodosVenderItem;
    function Valor(AValor: Currency)        : iControllerVendaMetodosVenderItem;
    function Executar                       : iControllerVendaMetodosVenderItem;
    function &End                           : iControllerVendaMetodos;
  end;

  iControllerVendaMetodosCancelarItem = interface
    ['{7DAC8169-40CB-44A1-82F3-B1CB1E9A553B}']
    function Index(AIndex: Integer): iControllerVendaMetodosCancelarItem;
    function Executar              : iControllerVendaMetodosCancelarItem;
    function &End                  : iControllerVendaMetodos;
  end;

  iControllerVendaMetodosDevolverItem = interface
    ['{A85C3F96-4285-4130-97DA-256E07091F6C}']
    function Codigo(ACodigo: String)        : iControllerVendaMetodosDevolverItem;
    function Quantidade(AQuantidade: Double): iControllerVendaMetodosDevolverItem;
    function Valor(AValor: Currency)        : iControllerVendaMetodosDevolverItem;
    function Executar                       : iControllerVendaMetodosDevolverItem;
    function &End                           : iControllerVendaMetodos;
  end;

implementation

end.
