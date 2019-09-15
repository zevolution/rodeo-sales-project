unit MFichas.Model.Impressao.Interfaces;

interface

type
  iModelImpressao                = interface;
  iModelImpressaoCaixa           = interface;
  iModelImpressaoCaixaFechamento = interface;

  iModelImpressao = interface
    ['{C6FBA054-684F-43F0-BC20-931CC2AA4EDC}']
    function Caixa: iModelImpressaoCaixa;
  end;

  iModelImpressaoCaixa = interface
    ['{FF00681A-C1D3-475F-A835-9DCB7B492977}']
    function Fechamento: iModelImpressaoCaixaFechamento;
    function &End      : iModelImpressao;
  end;

  iModelImpressaoCaixaFechamento = interface
    ['{E8DF567E-1999-4548-8487-7FBFF3CA7798}']
    function TituloDaImpressao(ATitulo: String): iModelImpressaoCaixaFechamento;
    function CodigoDoCaixa(AGUUID: String)     : iModelImpressaoCaixaFechamento;
    function ExecutarImpressao                 : iModelImpressaoCaixaFechamento;
    function &End                              : iModelImpressaoCaixa;
  end;

implementation

end.
