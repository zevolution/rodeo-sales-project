unit MFichas.Model.Item.Metodos.Cancelar;

interface

uses
  MFichas.Model.Item.Interfaces;

type
  TModelItemMetodosCancelar = class(TInterfacedObject, iModelItemMetodosCancelar)
  private
    [weak]
    FParent: iModelItem;
    FIndex : Integer;
    constructor Create(AParent: iModelItem);
  public
    destructor Destroy; override;
    class function New(AParent: iModelItem): iModelItemMetodosCancelar;
    function Index(AIndex: Integer): iModelItemMetodosCancelar;
    function &End                  : iModelItemMetodos;
  end;

implementation

{ TModelItemMetodosCancelar }

function TModelItemMetodosCancelar.&End: iModelItemMetodos;
begin
  //TODO: IMPLEMENTAR METODO DE CANCELAR ITEM
  Result := FParent.Metodos;
  FParent.Iterator.Remove(FIndex);
end;

constructor TModelItemMetodosCancelar.Create(AParent: iModelItem);
begin
  FParent := AParent;
end;

destructor TModelItemMetodosCancelar.Destroy;
begin

  inherited;
end;

function TModelItemMetodosCancelar.Index(
  AIndex: Integer): iModelItemMetodosCancelar;
begin
  Result := Self;
  FIndex := AIndex;
end;

class function TModelItemMetodosCancelar.New(AParent: iModelItem): iModelItemMetodosCancelar;
begin
  Result := Self.Create(AParent);
end;

end.
