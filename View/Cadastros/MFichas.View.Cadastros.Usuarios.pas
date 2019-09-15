unit MFichas.View.Cadastros.Usuarios;

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

  Data.DB;


type
  TTypeTabs = (tTabListarUsuarios, tTabCadastrarUsuarios, tTabEditarUsuarios, tTabMenu);

  TCadastrosUsuariosView = class(TForm)
    GestureManager1: TGestureManager;
    LayoutPrincipal: TLayout;
    TabControlPrincipal: TTabControl;
    TabItemListarUsuarios: TTabItem;
    RectangleListar: TRectangle;
    Layout1: TLayout;
    Circle1: TCircle;
    ShadowEffect1: TShadowEffect;
    ToolBarListar: TToolBar;
    LabelToolBarListar: TLabel;
    ButtonBackListar: TButton;
    ListViewUsuarios: TListView;
    Layout2: TLayout;
    Layout3: TLayout;
    Image1: TImage;
    TabItemCadastrarUsuarios: TTabItem;
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
    Label1: TLabel;
    EditCadastrarLogin: TEdit;
    Label2: TLabel;
    EditCadastrarNomeUsuario: TEdit;
    Label3: TLabel;
    TabItemEditarUsuarios: TTabItem;
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
    CheckBoxEditarAtivoInativo: TCheckBox;
    RectangleFundo: TRectangle;
    RectangleMenu: TRectangle;
    LabelEditar: TLabel;
    ShadowEffectEditar: TShadowEffect;
    EditCadastrarSenha: TEdit;
    CheckBoxCadastrarFiscal: TCheckBox;
    CheckBoxEditarFiscal: TCheckBox;
    Label4: TLabel;
    EditEditarSenha: TEdit;
    EditEditarNomeUsuario: TEdit;
    Label5: TLabel;
    EditEditarLogin: TEdit;
    Label6: TLabel;
    FDMemTableUsuarios: TFDMemTable;
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ListViewUsuariosGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure ListViewUsuariosDblClick(Sender: TObject);
    procedure RectangleMenuClick(Sender: TObject);
    procedure RoundRectBotaoCancelarAlteracaoClick(Sender: TObject);
    procedure RoundRectBotaoConfirmarAlteracaoClick(Sender: TObject);
    procedure RectangleFundoClick(Sender: TObject);
    procedure RoundRectBotaoCancelarCadastroClick(Sender: TObject);
    procedure RoundRectBotaoConfirmarCadastroClick(Sender: TObject);
    procedure ButtonBackCadastrarClick(Sender: TObject);
    procedure ButtonBackEditarClick(Sender: TObject);
    procedure ButtonBackListarClick(Sender: TObject);
    procedure EditCadastrarLoginChangeTracking(Sender: TObject);
    procedure EditCadastrarNomeUsuarioChangeTracking(Sender: TObject);
    procedure EditEditarLoginChangeTracking(Sender: TObject);
    procedure EditEditarNomeUsuarioChangeTracking(Sender: TObject);
  private
    { Private declarations }
    FTabs: TTypeTabs;
    FListItemUsuario: TListViewItem;
    procedure BuscarUsuarios;
    procedure PreencherListViewUsuarios;
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
  CadastrosUsuariosView: TCadastrosUsuariosView;

implementation

{$R *.fmx}

uses MFichas.Model.Usuario;

{ TCadastrosUsuariosView }

procedure TCadastrosUsuariosView.AbrirMenu;
begin
  RectangleFundo.Visible := True;
  RectangleMenu.Visible  := True;
  FTabs                  := tTabMenu;
end;

procedure TCadastrosUsuariosView.BuscarUsuarios;
begin
  TModelUsuario.New
  .Funcoes
    .Buscar
      .FDMemTable(FDMemTableUsuarios)
      .BuscarTodos
    .&End
  .&End;

  PreencherListViewUsuarios;
end;

procedure TCadastrosUsuariosView.ButtonBackCadastrarClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastrosUsuariosView.ButtonBackEditarClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastrosUsuariosView.ButtonBackListarClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastrosUsuariosView.EditCadastrarLoginChangeTracking(
  Sender: TObject);
begin
  EditCadastrarLogin.Text := AnsiUpperCase(EditCadastrarLogin.Text);
end;

procedure TCadastrosUsuariosView.EditCadastrarNomeUsuarioChangeTracking(
  Sender: TObject);
begin
  EditCadastrarNomeUsuario.Text := AnsiUpperCase(EditCadastrarNomeUsuario.Text);
end;

procedure TCadastrosUsuariosView.EditEditarLoginChangeTracking(Sender: TObject);
begin
  EditEditarLogin.Text := AnsiUpperCase(EditEditarLogin.Text);
end;

procedure TCadastrosUsuariosView.EditEditarNomeUsuarioChangeTracking(
  Sender: TObject);
begin
  EditEditarNomeUsuario.Text := AnsiUpperCase(EditEditarNomeUsuario.Text);
end;

procedure TCadastrosUsuariosView.FecharMenu;
begin
  RectangleFundo.Visible := False;
  RectangleMenu.Visible  := False;
end;

procedure TCadastrosUsuariosView.FormCreate(Sender: TObject);
begin
  RectangleMenu.Margins.Top    := LayoutPrincipal.Height / 2.20;
  RectangleMenu.Margins.Bottom := LayoutPrincipal.Height / 2.20;
  RectangleMenu.Margins.Right  := LayoutPrincipal.Height / 13;
  RectangleMenu.Margins.Left   := LayoutPrincipal.Height / 13;

  TabControlPrincipal.TabPosition := TTabPosition.None;
  TabControlPrincipal.ActiveTab := TabItemListarUsuarios;

  FTabs := tTabListarUsuarios;

  FecharMenu;
  BuscarUsuarios;
end;

procedure TCadastrosUsuariosView.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TCadastrosUsuariosView.Image1Click(Sender: TObject);
begin
  MudarAba(TabControlPrincipal, tTabCadastrarUsuarios, TabItemCadastrarUsuarios);
end;

procedure TCadastrosUsuariosView.LimparTelaDeCadastro;
begin
  EditCadastrarLogin.Text           := '';
  EditCadastrarNomeUsuario.Text     := '';
  EditCadastrarSenha.Text           := '';
  CheckBoxCadastrarFiscal.IsChecked := False;
end;

procedure TCadastrosUsuariosView.LimparTelaDeEdicao;
begin
  EditEditarLogin.Text                 := '';
  EditEditarNomeUsuario.Text           := '';
  EditEditarSenha.Text                 := '';
  CheckBoxEditarFiscal.IsChecked       := False;
  CheckBoxEditarAtivoInativo.IsChecked := False;
end;

procedure TCadastrosUsuariosView.ListViewUsuariosDblClick(Sender: TObject);
begin
  AbrirMenu;
end;

procedure TCadastrosUsuariosView.ListViewUsuariosGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = igiLongTap then
  begin
    AbrirMenu;
  end;
end;

procedure TCadastrosUsuariosView.MudarAba(ATabControl: TTabControl;
  ATypeTabs: TTypeTabs; AProximaTabItem: TTabItem);
begin
  ATabControl.ActiveTab := AProximaTabItem;
  FTabs                 := ATypeTabs;
end;

procedure TCadastrosUsuariosView.PreencherListViewUsuarios;
begin
  ListViewUsuarios.Items.Clear;
  FDMemTableUsuarios.First;
  while not FDMemTableUsuarios.EOF do
  begin
    FListItemUsuario := ListViewUsuarios.Items.Add;
    FListItemUsuario.Text := FDMemTableUsuarios.FieldByName('NOME').AsString;
    case FDMemTableUsuarios.FieldByName('STATUS').AsInteger of
      0: FListItemUsuario.Data[TMultiDetailAppearanceNames.Detail1] := 'Inativo';
      1: FListItemUsuario.Data[TMultiDetailAppearanceNames.Detail1] := 'Ativo';
    end;
    FListItemUsuario.Detail := FDMemTableUsuarios.FieldByName('GUUID').AsString;
    FDMemTableUsuarios.Next;
  end;
end;

procedure TCadastrosUsuariosView.RectangleFundoClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastrosUsuariosView.RectangleMenuClick(Sender: TObject);
var
  LCount: Integer;
  LGuuidIsEqual: Boolean;
begin
  FDMemTableUsuarios.First;
  LCount := 0;
  while not FDMemTableUsuarios.Eof do
  begin
    LGuuidIsEqual := FDMemTableUsuarios.FieldByName('GUUID').AsString = ListViewUsuarios.Items.AppearanceItem[ListViewUsuarios.ItemIndex].Detail;
    if LGuuidIsEqual then
    begin
      EditEditarLogin.Text       := FDMemTableUsuarios.FieldByName('LOGIN').AsString;
      EditEditarNomeUsuario.Text := FDMemTableUsuarios.FieldByName('NOME').AsString;
      EditEditarSenha.Text       := FDMemTableUsuarios.FieldByName('SENHA').AsString;
      case FDMemTableUsuarios.FieldByName('STATUS').AsInteger of
        0: CheckBoxEditarAtivoInativo.IsChecked := False;
        1: CheckBoxEditarAtivoInativo.IsChecked := True;
      end;
      case FDMemTableUsuarios.FieldByName('TIPO').AsInteger of
        0: CheckBoxEditarFiscal.IsChecked := False;
        1: CheckBoxEditarFiscal.IsChecked := True;
      end;
      Break;
    end;
    Inc(LCount);
    FDMemTableUsuarios.Next;
  end;

  FecharMenu;

  MudarAba(TabControlPrincipal, tTabEditarUsuarios, TabItemEditarUsuarios);
end;

procedure TCadastrosUsuariosView.RoundRectBotaoCancelarAlteracaoClick(
  Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastrosUsuariosView.RoundRectBotaoCancelarCadastroClick(
  Sender: TObject);
begin
  VoltarAbas;
end;

procedure TCadastrosUsuariosView.RoundRectBotaoConfirmarAlteracaoClick(
  Sender: TObject);
begin
  TModelUsuario.New
  .Funcoes
    .Editar
      .GUUID(ListViewUsuarios.Items.AppearanceItem[ListViewUsuarios.ItemIndex].Detail)
      .Login(EditEditarLogin.Text)
      .Nome(EditEditarNomeUsuario.Text)
      .Senha(EditEditarSenha.Text)
      .TipoUsuario(Integer(CheckBoxEditarFiscal.IsChecked))
      .AtivoInativo(Integer(CheckBoxEditarAtivoInativo.IsChecked))
    .&End
  .&End;

  BuscarUsuarios;
  PreencherListViewUsuarios;
  LimparTelaDeEdicao;
  MudarAba(TabControlPrincipal, tTabListarUsuarios, TabItemListarUsuarios);
end;

procedure TCadastrosUsuariosView.RoundRectBotaoConfirmarCadastroClick(
  Sender: TObject);
begin
  TModelUsuario.New
  .Funcoes
    .Cadastrar
      .Login(EditCadastrarLogin.Text)
      .Nome(EditCadastrarNomeUsuario.Text)
      .Senha(EditCadastrarSenha.Text)
      .TipoUsuario(Integer(CheckBoxCadastrarFiscal.IsChecked))
    .&End
  .&End;

  BuscarUsuarios;
  PreencherListViewUsuarios;
  LimparTelaDeCadastro;
  MudarAba(TabControlPrincipal, tTabListarUsuarios, TabItemListarUsuarios);
end;

procedure TCadastrosUsuariosView.VoltarAbas;
begin
  case FTabs of
    tTabListarUsuarios:    begin
                             CadastrosUsuariosView.Close;
                             {$IFDEF ANDROID OR IOS}
                             if Assigned(CadastrosUsuariosView) then
                             begin
                               CadastrosUsuariosView.DisposeOf;
                               CadastrosUsuariosView.Free;
                             end;
                             {$ENDIF}
                           end;

    tTabCadastrarUsuarios: begin
                             LimparTelaDeCadastro;
                             MudarAba(TabControlPrincipal, tTabListarUsuarios, TabItemListarUsuarios);
                           end;

    tTabEditarUsuarios:    begin
                             LimparTelaDeEdicao;
                             MudarAba(TabControlPrincipal, tTabListarUsuarios, TabItemListarUsuarios);
                           end;

    tTabMenu:              begin
                             FecharMenu;
                             FTabs := tTabListarUsuarios;
                           end;
  end;
end;

end.
