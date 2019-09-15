unit MFichas.Model.Caixa.Metodos.Factory;

interface

uses
  MFichas.Model.Caixa.Interfaces,
  MFichas.Model.Caixa.Metodos.Interfaces,
  MFichas.Model.Caixa.Metodos.Abrir,
  MFichas.Model.Caixa.Metodos.Fechar,
  MFichas.Model.Caixa.Metodos.Suprimento,
  MFichas.Model.Caixa.Metodos.Sangria;

type
  TModelCaixaMetodosFactory = class(TInterfacedObject, iModelCaixaMetodosFactory)
  private
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iModelCaixaMetodosFactory;
    function CaixaMetodoAbrir(AParent: iModelCaixa)     : iModelCaixaMetodosAbrir;
    function CaixaMetodoFechar(AParent: iModelCaixa)    : iModelCaixaMetodosFechar;
    function CaixaMetodoSuprimento(AParent: iModelCaixa): iModelCaixaMetodosSuprimento;
    function CaixaMetodoSangria   (AParent: iModelCaixa): iModelCaixaMetodosSangria;
  end;

implementation

{ TModelCaixaMetodosFactory }

function TModelCaixaMetodosFactory.CaixaMetodoAbrir(AParent: iModelCaixa): iModelCaixaMetodosAbrir;
begin
  Result := TModelCaixaMetodosAbrir.New(AParent);
end;

function TModelCaixaMetodosFactory.CaixaMetodoFechar(AParent: iModelCaixa): iModelCaixaMetodosFechar;
begin
  Result := TModelCaixaMetodosFechar.New(AParent);
end;

function TModelCaixaMetodosFactory.CaixaMetodoSangria(AParent: iModelCaixa): iModelCaixaMetodosSangria;
begin
  Result := TModelCaixaMetodosSangria.New(AParent);
end;

function TModelCaixaMetodosFactory.CaixaMetodoSuprimento(AParent: iModelCaixa): iModelCaixaMetodosSuprimento;
begin
  Result := TModelCaixaMetodosSuprimento.New(AParent);
end;

constructor TModelCaixaMetodosFactory.Create;
begin

end;

destructor TModelCaixaMetodosFactory.Destroy;
begin

  inherited;
end;

class function TModelCaixaMetodosFactory.New: iModelCaixaMetodosFactory;
begin
  Result := Self.Create;
end;

end.
