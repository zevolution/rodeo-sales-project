unit MFichas.Model.Caixa.State.Interfaces;

interface

uses
  MFichas.Model.Caixa.Interfaces;

type
  iModelCaixaStateFactory = interface
    ['{4CD3AD34-5651-4893-9C98-513CD637EA9C}']
    function Aberto  : iModelCaixaMetodos;
    function Fechado: iModelCaixaMetodos;
  end;

implementation

end.
