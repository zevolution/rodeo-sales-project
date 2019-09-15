unit MFichas.Model.Empresa.Metodos.Buscar.Model;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  MFichas.Model.Entidade.EMPRESA,
  MFichas.Model.Empresa.Interfaces;

type
  TModelEmpresaMetodosBuscarModel = class(TInterfacedObject, iModelEmpresaMetodosBuscarModel)
  private
    [weak]
    FParent: iModelEmpresa;
    FListaEmpresa: TObjectList<TEMPRESA>;
    constructor Create(AParent: iModelEmpresa);
  public
    destructor Destroy; override;
    class function New(AParent: iModelEmpresa): iModelEmpresaMetodosBuscarModel;
    function NomeDaEmpresa: String;
    function &End         : iModelEmpresaMetodos;
  end;

implementation

{ TModelEmpresaMetodosBuscarModel }

function TModelEmpresaMetodosBuscarModel.&End: iModelEmpresaMetodos;
begin
  Result := FParent.Metodos;
end;

constructor TModelEmpresaMetodosBuscarModel.Create(AParent: iModelEmpresa);
begin
  FParent := AParent;
end;

destructor TModelEmpresaMetodosBuscarModel.Destroy;
begin
  {$IFDEF MSWINDOWS}
  if Assigned(FListaEmpresa) then
    FreeAndNil(FListaEmpresa);
  {$ELSE}
  if Assigned(FListaEmpresa) then
  begin
    FListaEmpresa.Free;
    FListaEmpresa.DisposeOf;
  end;
  {$ENDIF}
  inherited;
end;

class function TModelEmpresaMetodosBuscarModel.New(AParent: iModelEmpresa): iModelEmpresaMetodosBuscarModel;
begin
  Result := Self.Create(AParent);
end;

function TModelEmpresaMetodosBuscarModel.NomeDaEmpresa: String;
begin
  FListaEmpresa := FParent.DAO.Find;
  Result := FListaEmpresa.Items[0].DESCRICAO;
end;

end.
