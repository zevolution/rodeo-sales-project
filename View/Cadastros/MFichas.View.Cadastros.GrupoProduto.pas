unit MFichas.View.Cadastros.GrupoProduto;

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

  MFichas.Model.GrupoProduto;

type
  TTypeTabs = (tTabListarGrupos, tTabCadastrarGrupos, tTabEditarGrupos, tTabMenu);

  TCadastroGrupoProdutoView = class(TForm)
    GestureManager1: TGestureManager;
    LayoutPrincipal: TLayout;
    TabControlPrincipal: TTabControl;
    TabItemListarGrupos: TTabItem;
    RectangleListar: TRectangle;
    Layout1: TLayout;
    Circle1: TCircle;
    ShadowEffect1: TShadowEffect;
    ToolBarListar: TToolBar;
    LabelToolBarListar: TLabel;
    ButtonBackListar: TButton;
    ListViewGrupos: TListView;
    Layout2: TLayout;
    Layout3: TLayout;
    Image1: TImage;
    TabItemCadastrarGrupos: TTabItem;
    Rectangle1: TRectangle;
    ToolBar1: TToolBar;
    LabelToolBarCadastrar: TLabel;
    ButtonBackCadastrar: TButton;
    Layout4: TLayout;
    LayoutDireita: TLayout;
    RoundRectBotaoConfirmarCadastro: TRoundRect;
    LabelBotaoConfirmar: TLabel;
    LayoutEsquerda: TLayout;
    RoundRectBotaoCancelarCadastro: TRoundRect;
    LabelBotaoCancelar: TLabel;
    Layout6: TLayout;
    EditCadastrarDescricao: TEdit;
    TabItemEditarGrupos: TTabItem;
    Rectangle2: TRectangle;
    ToolBar2: TToolBar;
    LabelToolBarEditar: TLabel;
    ButtonBackEditar: TButton;
    Layout5: TLayout;
    Layout8: TLayout;
    RoundRectBotaoConfirmarAlteracao: TRoundRect;
    Label7: TLabel;
    Layout9: TLayout;
    RoundRectBotaoCancelarAlteracao: TRoundRect;
    Label8: TLabel;
    Layout7: TLayout;
    Label4: TLabel;
    EditEditarDescricao: TEdit;
    CheckBoxEditarAtivoInativo: TCheckBox;
    RectangleFundo: TRectangle;
    RectangleMenu: TRectangle;
    LabelEditar: TLabel;
    ShadowEffectEditar: TShadowEffect;
    FDMemTableGrupos: TFDMemTable;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ListViewGruposGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure RectangleMenuClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ListViewGruposDblClick(Sender: TObject);
    procedure ButtonBackListarClick(Sender: TObject);
    procedure ButtonBackCadastrarClick(Sender: TObject);
    procedure ButtonBackEditarClick(Sender: TObject);
    procedure RoundRectBotaoCancelarCadastroClick(Sender: TObject);
    procedure RoundRectBotaoCancelarAlteracaoClick(Sender: TObject);
    procedure RoundRectBotaoConfirmarCadastroClick(Sender: TObject);
    procedure RoundRectBotaoConfirmarAlteracaoClick(Sender: TObject);
    procedure RectangleFundoClick(Sender: TObject);
    procedure EditCadastrarDescricaoChangeTracking(Sender: TObject);
    procedure EditEditarDescricaoChangeTracking(Sender: TObject);
  private
    { Private declarations }
    FTabs: TTypeTabs;
    FListItemGrupo: TListViewItem;
    procedure BuscarGrupos;
    procedure PreencherListViewGrupos;
    procedure LimparTelaDeCadastro;
    procedure LimparTelaDeEdicao;
    procedure AbrirMenu;
    procedure FecharMenu;
    procedure VoltarAbas;
    procedure MudarAba(ATabControl: TTabControl; ATypeTabs: TTypeTabs;
  AProximaTabItem: TTabItem);
  public
    { Public declarations }
  end;

var
  CadastroGrupoProdutoView: TCadastroGrupoProdutoView;

implementation

{$R *.fmx}

procedure TCadastroGrupoProdutoView.AbrirMenu;
begin
  RectangleFundo.Visible := True;
  RectangleMenu.Visible  := True;
  FTabs                  := tTabMenu;
end;

procedure TCadastroGrupoProdutoView.BuscarGrupos;
begin
  TModelGrupoProduto.New
  .Metodos
    .Buscar
      .FDMemTable(FDMemTableGrupos)
      .BuscarTodos
    .&End
  .&End;

  PreencherListViewGrupos;
end;

procedure TCadastroGrupoProdutoView.ButtonBackCadastrarClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastroGrupoProdutoView.ButtonBackEditarClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastroGrupoProdutoView.ButtonBackListarClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastroGrupoProdutoView.EditCadastrarDescricaoChangeTracking(
  Sender: TObject);
begin
  EditCadastrarDescricao.Text := AnsiUpperCase(EditCadastrarDescricao.Text);
end;

procedure TCadastroGrupoProdutoView.EditEditarDescricaoChangeTracking(
  Sender: TObject);
begin
  EditEditarDescricao.Text := AnsiUpperCase(EditEditarDescricao.Text);
end;

procedure TCadastroGrupoProdutoView.FecharMenu;
begin
  RectangleFundo.Visible := False;
  RectangleMenu.Visible  := False;
end;

procedure TCadastroGrupoProdutoView.FormCreate(Sender: TObject);
begin
  RectangleMenu.Margins.Top    := LayoutPrincipal.Height / 2.20;
  RectangleMenu.Margins.Bottom := LayoutPrincipal.Height / 2.20;
  RectangleMenu.Margins.Right  := LayoutPrincipal.Height / 13;
  RectangleMenu.Margins.Left   := LayoutPrincipal.Height / 13;

  TabControlPrincipal.TabPosition := TTabPosition.None;
  TabControlPrincipal.ActiveTab := TabItemListarGrupos;

  FTabs := tTabListarGrupos;

  FecharMenu;
  BuscarGrupos;
end;

procedure TCadastroGrupoProdutoView.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TCadastroGrupoProdutoView.Image1Click(Sender: TObject);
begin
  MudarAba(TabControlPrincipal, tTabCadastrarGrupos, TabItemCadastrarGrupos);
end;

procedure TCadastroGrupoProdutoView.LimparTelaDeCadastro;
begin
  EditCadastrarDescricao.Text := '';
end;

procedure TCadastroGrupoProdutoView.LimparTelaDeEdicao;
begin
  EditEditarDescricao.Text := '';
end;

procedure TCadastroGrupoProdutoView.ListViewGruposDblClick(Sender: TObject);
begin
  AbrirMenu;
end;

procedure TCadastroGrupoProdutoView.ListViewGruposGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = igiLongTap then
  begin
    AbrirMenu;
  end;
end;

procedure TCadastroGrupoProdutoView.MudarAba(ATabControl: TTabControl;
  ATypeTabs: TTypeTabs; AProximaTabItem: TTabItem);
begin
  ATabControl.ActiveTab := AProximaTabItem;
  FTabs                 := ATypeTabs;
end;

procedure TCadastroGrupoProdutoView.PreencherListViewGrupos;
begin
  ListViewGrupos.Items.Clear;
  FDMemTableGrupos.First;
  while not FDMemTableGrupos.EOF do
  begin
    FListItemGrupo := ListViewGrupos.Items.Add;
    FListItemGrupo.Text := FDMemTableGrupos.FieldByName('DESCRICAO').AsString;
    case FDMemTableGrupos.FieldByName('STATUS').AsInteger of
      0: FListItemGrupo.Data[TMultiDetailAppearanceNames.Detail1] := 'Inativo';
      1: FListItemGrupo.Data[TMultiDetailAppearanceNames.Detail1] := 'Ativo';
    end;
    FListItemGrupo.Detail := FDMemTableGrupos.FieldByName('GUUID').AsString;
    FDMemTableGrupos.Next;
  end;
end;

procedure TCadastroGrupoProdutoView.RectangleFundoClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastroGrupoProdutoView.RectangleMenuClick(Sender: TObject);
var
  LCount       : Integer;
  LGuuidIsEqual: Boolean;
begin
  FDMemTableGrupos.First;
  LCount := 0;
  while not FDMemTableGrupos.Eof do
  begin
    LGuuidIsEqual := FDMemTableGrupos.FieldByName('GUUID').AsString = ListViewGrupos.Items.AppearanceItem[ListViewGrupos.ItemIndex].Detail;
    if LGuuidIsEqual then
    begin
      EditEditarDescricao.Text := FDMemTableGrupos.FieldByName('DESCRICAO').AsString;
      case FDMemTableGrupos.FieldByName('STATUS').AsInteger of
        0: CheckBoxEditarAtivoInativo.IsChecked := False;
        1: CheckBoxEditarAtivoInativo.IsChecked := True;
      end;
      Break;
    end;
    Inc(LCount);
    FDMemTableGrupos.Next;
  end;

  FecharMenu;

  MudarAba(TabControlPrincipal, tTabEditarGrupos, TabItemEditarGrupos);
end;

procedure TCadastroGrupoProdutoView.RoundRectBotaoCancelarAlteracaoClick(
  Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastroGrupoProdutoView.RoundRectBotaoCancelarCadastroClick(
  Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastroGrupoProdutoView.RoundRectBotaoConfirmarAlteracaoClick(
  Sender: TObject);
begin
  TModelGrupoProduto.New
  .Metodos
    .Editar
      .GUUID(ListViewGrupos.Items.AppearanceItem[ListViewGrupos.ItemIndex].Detail)
      .Descricao(EditEditarDescricao.Text)
      .AtivoInativo(Integer(CheckBoxEditarAtivoInativo.IsChecked))
    .&End
  .&End;

  BuscarGrupos;
  PreencherListViewGrupos;
  LimparTelaDeEdicao;
  MudarAba(TabControlPrincipal, tTabListarGrupos, TabItemListarGrupos);
end;

procedure TCadastroGrupoProdutoView.RoundRectBotaoConfirmarCadastroClick(
  Sender: TObject);
begin
  TModelGrupoProduto.New
  .Metodos
    .Cadastrar
      .Descricao(EditCadastrarDescricao.Text)
    .&End
  .&End;

  BuscarGrupos;
  PreencherListViewGrupos;
  LimparTelaDeCadastro;
  MudarAba(TabControlPrincipal, tTabListarGrupos, TabItemListarGrupos);
end;

procedure TCadastroGrupoProdutoView.VoltarAbas;
begin
  case FTabs of
    tTabListarGrupos:    begin
                           CadastroGrupoProdutoView.Close;
                           {$IFDEF ANDROID OR IOS}
                           if Assigned(CadastroGrupoProdutoView) then
                           begin
                             CadastroGrupoProdutoView.DisposeOf;
                             CadastroGrupoProdutoView.Free;
                           end;
                           {$ENDIF}
                           end;

    tTabCadastrarGrupos: begin
                             LimparTelaDeCadastro;
                             MudarAba(TabControlPrincipal, tTabListarGrupos, TabItemListarGrupos);
                           end;

    tTabEditarGrupos:    begin
                             LimparTelaDeEdicao;
                             MudarAba(TabControlPrincipal, tTabListarGrupos, TabItemListarGrupos);
                           end;

    tTabMenu:              begin
                             FecharMenu;
                             FTabs := tTabListarGrupos;
                           end;
  end;
end;

end.
