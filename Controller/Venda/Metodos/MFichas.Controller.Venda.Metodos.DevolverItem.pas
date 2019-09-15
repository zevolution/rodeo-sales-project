unit MFichas.Controller.Venda.Metodos.DevolverItem;

interface

uses
  MFichas.Controller.Venda.Interfaces,

  MFichas.Model.Venda.Interfaces,
  MFichas.Model.Item;

type
  TControllerVendaMetodosDevolverItem = class(TInterfacedObject, iControllerVendaMetodosDevolverItem)
  private
    [weak]
    FParent    : iControllerVenda;
    FModel     : iModelVenda;
    FCodigo    : String;
    FQuantidade: Currency;
    FValor     : Currency;
    constructor Create(AParent: iControllerVenda; AModel: iModelVenda);
  public
    destructor Destroy; override;
    class function New(AParent: iControllerVenda; AModel: iModelVenda): iControllerVendaMetodosDevolverItem;
    function Codigo(ACodigo: String)        : iControllerVendaMetodosDevolverItem;
    function Quantidade(AQuantidade: Double): iControllerVendaMetodosDevolverItem;
    function Valor(AValor: Currency)        : iControllerVendaMetodosDevolverItem;
    function Executar                       : iControllerVendaMetodosDevolverItem;
    function &End                           : iControllerVendaMetodos;
  end;

implementation

{ TControllerVendaMetodosDevolverItem }

function TControllerVendaMetodosDevolverItem.Codigo(
  ACodigo: String): iControllerVendaMetodosDevolverItem;
begin
  Result  := Self;
  FCodigo := ACodigo;
end;

function TControllerVendaMetodosDevolverItem.&End: iControllerVendaMetodos;
begin
  Result := FParent.Metodos;
end;

constructor TControllerVendaMetodosDevolverItem.Create(AParent: iControllerVenda; AModel: iModelVenda);
begin
  FParent := AParent;
  FModel  := AModel;
end;

destructor TControllerVendaMetodosDevolverItem.Destroy;
begin

  inherited;
end;

function TControllerVendaMetodosDevolverItem.Executar: iControllerVendaMetodosDevolverItem;
begin
  Result := Self;
  FModel
  .Item
  .Iterator
    .Add(
      TModelItem.New(FModel)
      .Metodos
        .Devolver
          .Codigo(FCodigo)
          .Quantidade(FQuantidade)
          .Valor(FValor)
        .&End
      .&End
    )
  .&End;
end;

class function TControllerVendaMetodosDevolverItem.New(AParent: iControllerVenda; AModel: iModelVenda): iControllerVendaMetodosDevolverItem;
begin
  Result := Self.Create(AParent, AModel);
end;

function TControllerVendaMetodosDevolverItem.Quantidade(
  AQuantidade: Double): iControllerVendaMetodosDevolverItem;
begin
  Result      := Self;
  FQuantidade := AQuantidade;
end;

function TControllerVendaMetodosDevolverItem.Valor(
  AValor: Currency): iControllerVendaMetodosDevolverItem;
begin
  Result := Self;
  FValor := AValor;
end;

end.
