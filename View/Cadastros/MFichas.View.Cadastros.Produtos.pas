unit MFichas.View.Cadastros.Produtos;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.StdCtrls,
  FMX.ListView,
  FMX.Controls.Presentation,
  FMX.Objects,
  FMX.TabControl,
  FMX.Layouts,
  FMX.Platform,
  FMX.VirtualKeyboard,
  FMX.Gestures,
  FMX.Effects,
  FMX.ListBox,
  FMX.Edit,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  MultiDetailAppearanceU,

  Data.DB,

  MFichas.Model.Produto,
  MFichas.Model.GrupoProduto;

type
  TTypeTabs = (tTabListarProdutos, tTabCadastrarProdutos, tTabEditarProdutos, tTabMenu);

  TCadastroProdutoView = class(TForm)
    LayoutPrincipal: TLayout;
    TabControlPrincipal: TTabControl;
    TabItemListarProdutos: TTabItem;
    TabItemCadastrarProdutos: TTabItem;
    TabItemEditarProdutos: TTabItem;
    RectangleListar: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    ToolBarListar: TToolBar;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    LabelToolBarListar: TLabel;
    ButtonBackListar: TButton;
    LabelToolBarCadastrar: TLabel;
    LabelToolBarEditar: TLabel;
    ButtonBackCadastrar: TButton;
    ButtonBackEditar: TButton;
    ListViewProdutos: TListView;
    Layout2: TLayout;
    GestureManager1: TGestureManager;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Label1: TLabel;
    EditCadastrarDescricao: TEdit;
    Label2: TLabel;
    EditCadastrarPreco: TEdit;
    Label3: TLabel;
    ComboBoxCadastrarGrupo: TComboBox;
    Layout7: TLayout;
    Label4: TLabel;
    EditEditarDescricao: TEdit;
    Label5: TLabel;
    EditEditarPreco: TEdit;
    Label6: TLabel;
    ComboBoxEditarGrupo: TComboBox;
    CheckBoxEditarAtivoInativo: TCheckBox;
    LayoutDireita: TLayout;
    RoundRectBotaoConfirmarCadastro: TRoundRect;
    LabelBotaoConfirmar: TLabel;
    LayoutEsquerda: TLayout;
    RoundRectBotaoCancelarCadastro: TRoundRect;
    LabelBotaoCancelar: TLabel;
    Layout8: TLayout;
    RoundRectBotaoConfirmarAlteracao: TRoundRect;
    Label7: TLabel;
    Layout9: TLayout;
    RoundRectBotaoCancelarAlteracao: TRoundRect;
    Label8: TLabel;
    FDMemTableProdutos: TFDMemTable;
    FDMemTableGrupos: TFDMemTable;
    Circle1: TCircle;
    ShadowEffect1: TShadowEffect;
    Layout3: TLayout;
    Image1: TImage;
    Layout10: TLayout;
    RectangleFundo: TRectangle;
    RectangleMenu: TRectangle;
    LabelEditar: TLabel;
    ShadowEffectEditar: TShadowEffect;
    procedure Image1Click(Sender: TObject);
    procedure ButtonBackCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RoundRectBotaoConfirmarCadastroClick(Sender: TObject);
    procedure RoundRectBotaoCancelarCadastroClick(Sender: TObject);
    procedure ListViewProdutosGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure RectangleMenuClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure RoundRectBotaoConfirmarAlteracaoClick(Sender: TObject);
    procedure RoundRectBotaoCancelarAlteracaoClick(Sender: TObject);
    procedure EditCadastrarDescricaoChangeTracking(Sender: TObject);
    procedure EditEditarDescricaoChangeTracking(Sender: TObject);
    procedure RectangleFundoClick(Sender: TObject);
    procedure ButtonBackEditarClick(Sender: TObject);
    procedure ListViewProdutosDblClick(Sender: TObject);
    procedure ButtonBackListarClick(Sender: TObject);
  private
    { Private declarations }
    FTabs           : TTypeTabs;
    FListItemProduto: TListViewItem;
    procedure BuscarProdutos;
    procedure BuscarGrupos;
    procedure PreencherComboBoxGrupos;
    procedure PreencherListViewProdutos;
    procedure LimparTelaDeCadastro;
    procedure LimparTelaDeEdicao;
    procedure AbrirMenu;
    procedure FecharMenu;
    procedure VoltarAbas;
    procedure MudarAba(ATabControl: TTabControl; ATypeTabs: TTypeTabs;
  AProximaTabItem: TTabItem);
    function PegarGUUIDDoGrupoSelecionado: String;
    function PegarIndexDoComboBoxDeEdicao: Integer;
  public
    { Public declarations }
  end;

var
  CadastroProdutoView: TCadastroProdutoView;

implementation

{$R *.fmx}

procedure TCadastroProdutoView.ButtonBackCadastrarClick(Sender: TObject);
begin
  TabControlPrincipal.ActiveTab := TabItemListarProdutos;
end;

procedure TCadastroProdutoView.ButtonBackEditarClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastroProdutoView.ButtonBackListarClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastroProdutoView.EditCadastrarDescricaoChangeTracking(
  Sender: TObject);
begin
  EditCadastrarDescricao.Text := AnsiUpperCase(EditCadastrarDescricao.Text);
end;

procedure TCadastroProdutoView.EditEditarDescricaoChangeTracking(
  Sender: TObject);
begin
  EditEditarDescricao.Text := AnsiUpperCase(EditEditarDescricao.Text);
end;

procedure TCadastroProdutoView.FecharMenu;
begin
  RectangleFundo.Visible := False;
  RectangleMenu.Visible  := False;
end;

procedure TCadastroProdutoView.FormCreate(Sender: TObject);
begin
  RectangleMenu.Margins.Top    := LayoutPrincipal.Height / 2.20;
  RectangleMenu.Margins.Bottom := LayoutPrincipal.Height / 2.20;
  RectangleMenu.Margins.Right  := LayoutPrincipal.Height / 13;
  RectangleMenu.Margins.Left   := LayoutPrincipal.Height / 13;

  TabControlPrincipal.TabPosition := TTabPosition.None;
  TabControlPrincipal.ActiveTab := TabItemListarProdutos;

  FTabs := tTabListarProdutos;

  FecharMenu;
  BuscarProdutos;
  BuscarGrupos;
  PreencherComboBoxGrupos;
end;

procedure TCadastroProdutoView.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  LTeclado: IFMXVirtualKeyboardService;
begin
  if (Key = vkHardwareBack) then
  begin
    TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(LTeclado));
    if (LTeclado <> nil) and (TVirtualKeyboardState.Visible in LTeclado.VirtualKeyboardState) then
    begin
    end
    else
    begin
      Key := 0;
      VoltarAbas;
    end;
  end;
end;

procedure TCadastroProdutoView.BuscarProdutos;
begin
  TModelProduto.New
  .Metodos
    .BuscarView
      .FDMemTable(FDMemTableProdutos)
      .BuscarTodos
    .&End
  .&End;

  PreencherListViewProdutos;
end;

procedure TCadastroProdutoView.AbrirMenu;
begin
  RectangleFundo.Visible := True;
  RectangleMenu.Visible  := True;
  FTabs                  := tTabMenu;
end;

procedure TCadastroProdutoView.BuscarGrupos;
begin
  TModelGrupoProduto.New
  .Metodos
    .Buscar
      .FDMemTable(FDMemTableGrupos)
      .BuscarTodosAtivos
    .&End
  .&End;
end;

function TCadastroProdutoView.PegarGUUIDDoGrupoSelecionado: String;
var
  LCount: Integer;
  LComboBox: TComboBox;
begin
  if TabControlPrincipal.ActiveTab = TabItemCadastrarProdutos then
    LComboBox := ComboBoxCadastrarGrupo
  else
    LComboBox := ComboBoxEditarGrupo;

  FDMemTableGrupos.First;
  LCount := 0;
  while not FDMemTableGrupos.Eof do
  begin
    if LCount = LComboBox.ItemIndex then
    begin
      Result := FDMemTableGrupos.FieldByName('GUUID').AsString;
      Break;
    end;
    Inc(LCount);
    FDMemTableGrupos.Next;
  end;
end;

function TCadastroProdutoView.PegarIndexDoComboBoxDeEdicao: Integer;
var
  LDescricaoGrupo: String;
begin
  FDMemTableGrupos.First;
  while not FDMemTableGrupos.Eof do
  begin  
    if FDMemTableProdutos.FieldByName('GRUPO').AsString =
      FDMemTableGrupos.FieldByName('GUUID').AsString then
    begin
      LDescricaoGrupo := FDMemTableGrupos.FieldByName('DESCRICAO').AsString;
      Break;
    end;
    FDMemTableGrupos.Next;
  end;
  
  Result := ComboBoxEditarGrupo.Items.IndexOf(LDescricaoGrupo);
end;

procedure TCadastroProdutoView.PreencherComboBoxGrupos;
begin
  FDMemTableGrupos.First;
  while not FDMemTableGrupos.EOF do
  begin
    ComboBoxCadastrarGrupo.Items.Add(
      FDMemTableGrupos.FieldByName('DESCRICAO').AsString
    );
    ComboBoxEditarGrupo.Items.Add(
      FDMemTableGrupos.FieldByName('DESCRICAO').AsString
    );
    FDMemTableGrupos.Next;
  end;

end;

procedure TCadastroProdutoView.PreencherListViewProdutos;
begin
  ListViewProdutos.Items.Clear;
  FDMemTableProdutos.First;
  ListViewProdutos.BeginUpdate;
  while not FDMemTableProdutos.EOF do
  begin
    FListItemProduto := ListViewProdutos.Items.Add;
    FListItemProduto.Text := FDMemTableProdutos.FieldByName('DESCRICAO').AsString;
    case FDMemTableProdutos.FieldByName('STATUS').AsInteger of
      0: FListItemProduto.Data[TMultiDetailAppearanceNames.Detail1] := 'Inativo';
      1: FListItemProduto.Data[TMultiDetailAppearanceNames.Detail1] := 'Ativo';
    end;
    FListItemProduto.Detail := FDMemTableProdutos.FieldByName('GUUID').AsString;
    FDMemTableProdutos.Next;
  end;
  ListViewProdutos.EndUpdate;
end;

procedure TCadastroProdutoView.RectangleFundoClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastroProdutoView.RectangleMenuClick(Sender: TObject);
var
  LCount: Integer;
  LGuuidIsEqual: Boolean;
begin
  FDMemTableProdutos.First;
  LCount := 0;
  while not FDMemTableProdutos.Eof do
  begin
    LGuuidIsEqual := FDMemTableProdutos.FieldByName('GUUID').AsString = ListViewProdutos.Items.AppearanceItem[ListViewProdutos.ItemIndex].Detail;
    if LGuuidIsEqual then
    begin
      EditEditarDescricao.Text      := FDMemTableProdutos.FieldByName('DESCRICAO').AsString; 
      EditEditarPreco.Text          := FormatCurr('#,##0.00', FDMemTableProdutos.FieldByName('PRECO').AsCurrency);
      ComboBoxEditarGrupo.ItemIndex := PegarIndexDoComboBoxDeEdicao;
      case FDMemTableProdutos.FieldByName('STATUS').AsInteger of
        0: CheckBoxEditarAtivoInativo.IsChecked := False;
        1: CheckBoxEditarAtivoInativo.IsChecked := True;
      end;
      Break;
    end;
    Inc(LCount);
    FDMemTableProdutos.Next;
  end;

  FecharMenu;
  
  MudarAba(TabControlPrincipal, tTabEditarProdutos, TabItemEditarProdutos);
end;

procedure TCadastroProdutoView.RoundRectBotaoCancelarAlteracaoClick(
  Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastroProdutoView.RoundRectBotaoCancelarCadastroClick(
  Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastroProdutoView.RoundRectBotaoConfirmarAlteracaoClick(
  Sender: TObject);
begin
  if EditEditarPreco.Text.IsNullOrWhiteSpace(EditEditarPreco.Text) then
    raise Exception.Create(
      'N�o � poss�vel alterar este produto sem um pre�o de venda.'
    );

  TModelProduto.New
  .Metodos
    .EditarView
      .GUUID(ListViewProdutos.Items.AppearanceItem[ListViewProdutos.ItemIndex].Detail)
      .Descricao(EditEditarDescricao.Text)
      .Valor(EditEditarPreco.Text.Replace('.','').ToDouble)
      .Grupo(PegarGUUIDDoGrupoSelecionado)
      .AtivoInativo(Integer(CheckBoxEditarAtivoInativo.IsChecked))
    .&End
  .&End;

  BuscarProdutos;
  PreencherListViewProdutos;
  LimparTelaDeEdicao;
  MudarAba(TabControlPrincipal, tTabListarProdutos, TabItemListarProdutos);
end;

procedure TCadastroProdutoView.RoundRectBotaoConfirmarCadastroClick(
  Sender: TObject);
begin
  if EditCadastrarPreco.Text.IsNullOrWhiteSpace(EditCadastrarPreco.Text) then
    raise Exception.Create(
      'N�o � poss�vel cadastrar este produto sem um pre�o de venda.'
    );

  TModelProduto.New
  .Metodos
    .CadastrarView
      .Descricao(EditCadastrarDescricao.Text)
      .Valor(EditCadastrarPreco.Text.Replace('.','').ToDouble)
      .Grupo(PegarGUUIDDoGrupoSelecionado)
    .&End
  .&End;

  BuscarProdutos;
  PreencherListViewProdutos;
  LimparTelaDeCadastro;
  MudarAba(TabControlPrincipal, tTabListarProdutos, TabItemListarProdutos);
end;

procedure TCadastroProdutoView.VoltarAbas;
begin
  case FTabs of
    tTabListarProdutos:    begin
                           CadastroProdutoView.Close;
                           {$IFDEF ANDROID OR IOS}
                           if Assigned(CadastroProdutoView) then
                           begin
                             CadastroProdutoView.DisposeOf;
                             CadastroProdutoView.Free;
                           end;
                           {$ENDIF}
                           end;

    tTabCadastrarProdutos: begin
                             LimparTelaDeCadastro;
                             MudarAba(TabControlPrincipal, tTabListarProdutos, TabItemListarProdutos);
                           end;

    tTabEditarProdutos:    begin
                             LimparTelaDeEdicao;
                             MudarAba(TabControlPrincipal, tTabListarProdutos, TabItemListarProdutos);
                           end;

    tTabMenu:              begin
                             FecharMenu;
                             FTabs := tTabListarProdutos;
                           end;
  end;
end;

procedure TCadastroProdutoView.Image1Click(Sender: TObject);
begin
  MudarAba(TabControlPrincipal, tTabCadastrarProdutos, TabItemCadastrarProdutos);
end;

procedure TCadastroProdutoView.LimparTelaDeCadastro;
begin
  EditCadastrarDescricao.Text      := '';
  EditCadastrarPreco.Text          := '';
  ComboBoxCadastrarGrupo.ItemIndex := -1;
end;

procedure TCadastroProdutoView.LimparTelaDeEdicao;
begin
  EditEditarDescricao.Text      := '';
  EditEditarPreco.Text          := '';
  ComboBoxEditarGrupo.ItemIndex := -1;
end;

procedure TCadastroProdutoView.ListViewProdutosDblClick(Sender: TObject);
begin
  AbrirMenu;
end;

procedure TCadastroProdutoView.ListViewProdutosGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = igiLongTap then
  begin
    AbrirMenu;
  end;
end;

procedure TCadastroProdutoView.MudarAba(ATabControl: TTabControl;
  ATypeTabs: TTypeTabs; AProximaTabItem: TTabItem);
begin
  ATabControl.ActiveTab := AProximaTabItem;
  FTabs                 := ATypeTabs;
end;

end.
