unit MFichas.Model.Caixa.State.Factory;

interface

uses
  MFichas.Model.Caixa.State.Interfaces,
  MFichas.Model.Caixa.Interfaces,
  MFichas.Model.Caixa.State.Aberto,
  MFichas.Model.Caixa.State.Fechado;

type
  TModelCaixaStateFactory = class(TInterfacedObject, iModelCaixaStateFactory)
  private
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iModelCaixaStateFactory;
    function Aberto  : iModelCaixaMetodos;
    function Fechado: iModelCaixaMetodos;
  end;

implementation

{ TModelCaixaStateFactory }

function TModelCaixaStateFactory.Aberto: iModelCaixaMetodos;
begin
  Result := TModelCaixaStateAberto.New;
end;

constructor TModelCaixaStateFactory.Create;
begin

end;

destructor TModelCaixaStateFactory.Destroy;
begin

  inherited;
end;

function TModelCaixaStateFactory.Fechado: iModelCaixaMetodos;
begin
  Result := TModelCaixaStateFechado.New;
end;

class function TModelCaixaStateFactory.New: iModelCaixaStateFactory;
begin
  Result := Self.Create;
end;

end.
