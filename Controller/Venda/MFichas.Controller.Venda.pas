unit MFichas.Controller.Venda;

interface

uses
  MFichas.Controller.Caixa.Interfaces,
  MFichas.Controller.Venda.Interfaces,
  MFichas.Controller.Venda.Metodos,

  MFichas.Model.Venda.Interfaces,
  MFichas.Model.Venda,
  MFichas.Model.Caixa;

type
  TControllerVenda = class(TInterfacedObject, iControllerVenda)
  private
    [weak]
    FParent : iControllerCaixa;
    FMetodos: iControllerVendaMetodos;
    FModel  : iModelVenda;
    class var FInstance: iControllerVenda;
    constructor Create(AParent: iControllerCaixa);
  public
    destructor Destroy; override;
    class function New(AParent: iControllerCaixa): iControllerVenda;
    function Metodos: iControllerVendaMetodos;
  end;

implementation

{ TControllerVenda }

constructor TControllerVenda.Create(AParent: iControllerCaixa);
begin
  FParent := AParent;
  if not Assigned(FModel) then
    FModel := TModelVenda.New(TModelCaixa.New);

  FMetodos := TControllerVendaMetodos.New(Self, FModel);
end;

destructor TControllerVenda.Destroy;
begin

  inherited;
end;

function TControllerVenda.Metodos: iControllerVendaMetodos;
begin
  Result := FMetodos;
end;

class function TControllerVenda.New(AParent: iControllerCaixa): iControllerVenda;
begin
  if not Assigned(FInstance) then
    FInstance := Self.Create(AParent);
  Result := FInstance;
end;

end.
