unit MaykoFichas.View.Principal;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.ImageList,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Edit,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.Objects,
  FMX.Ani,
  FMX.ListView,
  FMX.ImgList,
  FMX.TabControl,
  FMX.Layouts,
  FMX.MultiView,
  FMX.ListBox,
  FMX.Platform,
  FMX.DialogService,
  FMX.VirtualKeyboard,
  {$IFDEF ANDROID}
  Androidapi.JNI.Embarcadero,
  FMX.Platform.Android,
  Androidapi.Helpers,
  FMX.Helpers.Android,
  {$ENDIF}

  MFichas.Controller.Caixa,
  MFichas.Controller.Caixa.Interfaces,
  MFichas.Controller.Types,
  MFichas.Model.GrupoProduto,
  MFichas.Model.Produto,
  MFichas.View.Dialog.AberturaCaixa,
  MFichas.View.Dialog.PedirSenha,

  MultiDetailAppearanceU,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  Data.DB,

  MFichas.Controller.Venda.Interfaces,
  MFichas.Model.Permissoes.Interfaces,
  MFichas.Model.Usuario.Interfaces,
  MFichas.Model.Usuario,
  MFichas.View.Dialog.ConfirmarProduto,
  MFichas.View.Cadastros.Produtos,
  MFichas.View.Cadastros.GrupoProduto,
  MFichas.View.Relatorio;

type
  TTypeToastMessage = (tmProdutoLancado, tmPedidoRealizado, tmPedidoDevolvido);
  TTypeTabs         = (tTabLogin, tTabMenu, tTabGrupos, tTabProdutos, tTabConfirmacaoProduto, tTabCarrinho, tTabPagamento, tTabCapturaValor);

  TForm3 = class(TForm)
    LayoutPrincipal: TLayout;
    TabControlPrincipal: TTabControl;
    TabItemLogin: TTabItem;
    RectangleLogin: TRectangle;
    LayoutLogin: TLayout;
    LayoutUsuario: TLayout;
    GlyphUsuario: TGlyph;
    LineUsuario: TLine;
    LayoutSenha: TLayout;
    EditSenha: TEdit;
    GlyphSenha: TGlyph;
    LineSenha: TLine;
    LayoutBotaoConfirmar: TLayout;
    RoundRectBotaoConfirmar: TRoundRect;
    LabelBotaoConfirmar: TLabel;
    LayoutLogoTipo: TLayout;
    TabItemGrupos: TTabItem;
    LayoutClientes: TLayout;
    RectangleClientes: TRectangle;
    ListViewGrupos: TListView;
    ToolBarClientes: TToolBar;
    LabelToolBarGrupo: TLabel;
    ButtonBackClientes: TButton;
    TabItemProdutos: TTabItem;
    LayoutProdutos: TLayout;
    RectangleProdutos: TRectangle;
    ListViewProdutos: TListView;
    LayoutListViewBottom: TLayout;
    ImageCarrinho: TImage;
    LayoutBottomToast: TLayout;
    RectangleToast: TRectangle;
    LabelToast: TLabel;
    FloatAnimationLabelToast: TFloatAnimation;
    FloatAnimationToast: TFloatAnimation;
    ToolBar1: TToolBar;
    LabelToolBarProdutos: TLabel;
    ButtonBackProdutos: TButton;
    TabItemCarrinho: TTabItem;
    LayoutCarrinho: TLayout;
    RectangleCarrinho: TRectangle;
    ListViewCarrinho: TListView;
    LayoutCarrinhoBottom: TLayout;
    LayoutBotaoConfirmarBottom: TLayout;
    RoundRectConfirmarPedido: TRoundRect;
    LabelBotaoConfirmarPedido: TLabel;
    LayoutCarrinhoValorTotal: TLayout;
    LabelEscritaValorTotal: TLabel;
    LabelValorTotal: TLabel;
    Label1: TLabel;
    ToolBarCarrinho: TToolBar;
    LabelButtonBackCarrinho: TLabel;
    ButtonBackCarrinho: TButton;
    Circle1: TCircle;
    Layout3: TLayout;
    MultiView: TMultiView;
    ListBox1: TListBox;
    ListBoxItemCadastrarProdutos: TListBoxItem;
    ListBoxItemCadastrarGrupos: TListBoxItem;
    ListBoxItemCadastrarUsuarios: TListBoxItem;
    ListBoxItemRelatorios: TListBoxItem;
    ListBoxItemConfiguracoes: TListBoxItem;
    TabItemMenu: TTabItem;
    LayoutMenu: TLayout;
    Rectangle1: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    LayoutGrid1: TLayout;
    RectangleGrid1: TRectangle;
    LayoutGrid1Bottom: TLayout;
    LabelGrid1: TLabel;
    LayoutGrid1Top: TLayout;
    ImageGrid1: TImage;
    LayoutGrid5: TLayout;
    RectangleGrid5: TRectangle;
    LayoutGrid5Bottom: TLayout;
    LabelGrid5: TLabel;
    LayoutGrid5Top: TLayout;
    ImageGrid5: TImage;
    TabItemPagamento: TTabItem;
    LayoutPagamento: TLayout;
    Rectangle2: TRectangle;
    LayoutPagamentoTop: TLayout;
    LayoutPagamentoBottom: TLayout;
    LayoutPagamentoClient: TLayout;
    LayoutLeft: TLayout;
    LayoutCenter: TLayout;
    LayoutRight: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    Layout12: TLayout;
    Layout13: TLayout;
    RadioButtonDebito: TRadioButton;
    RadioButtonCredito: TRadioButton;
    Layout11: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RoundRectFinalizarPedido: TRoundRect;
    LabelBotaoFinalizarPedido: TLabel;
    Layout14: TLayout;
    Label5: TLabel;
    LabelPagamentoValorTotal: TLabel;
    Layout15: TLayout;
    Label7: TLabel;
    LabelTroco: TLabel;
    Layout16: TLayout;
    Label9: TLabel;
    LabelValorPago: TLabel;
    Layout17: TLayout;
    Layout18: TLayout;
    Layout19: TLayout;
    Layout20: TLayout;
    Layout21: TLayout;
    Layout22: TLayout;
    Layout23: TLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Layout24: TLayout;
    Button4: TButton;
    Layout25: TLayout;
    Button5: TButton;
    Layout26: TLayout;
    Button6: TButton;
    Layout27: TLayout;
    Button7: TButton;
    Layout28: TLayout;
    Button8: TButton;
    RadioButtonDinheiro: TRadioButton;
    FDMemTableGrupos: TFDMemTable;
    FDMemTableProdutos: TFDMemTable;
    Layout2: TLayout;
    Layout1: TLayout;
    RectangleToastMenu: TRectangle;
    LabelToastMenu: TLabel;
    FloatAnimationLabelToastMenu: TFloatAnimation;
    FloatAnimationToastMenu: TFloatAnimation;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    TimerToast: TTimer;
    TimerFecharToast: TTimer;
    TimerToastMenu: TTimer;
    TimerFecharToastMenu: TTimer;
    Layout29: TLayout;
    Layout30: TLayout;
    Circle2: TCircle;
    Image4: TImage;
    ToolBarPagamento: TToolBar;
    LabelToolBarPagamento: TLabel;
    ButtonBackPagamento: TButton;
    LayoutGrid2: TLayout;
    RectangleGrid2: TRectangle;
    LayoutGrid2Bottom: TLayout;
    LabelGrid2: TLabel;
    LayoutGrid2Top: TLayout;
    ImageGrid2: TImage;
    LayoutGrid3: TLayout;
    RectangleGrid3: TRectangle;
    LayoutGrid3Bottom: TLayout;
    LabelGrid3: TLabel;
    LayoutGrid3Top: TLayout;
    ImageGrid3: TImage;
    LayoutGrid4: TLayout;
    RectangleGrid4: TRectangle;
    LayoutGrid4Bottom: TLayout;
    LabelGrid4: TLabel;
    LayoutGrid4Top: TLayout;
    ImageGrid4: TImage;
    ComboBoxUsuario: TComboBox;
    ImageList1: TImageList;
    FDMemTableUsuarios: TFDMemTable;
    ListBoxMultiViewBottom: TListBox;
    ListBoxItemSair: TListBoxItem;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Layout11Click(Sender: TObject);
    procedure LayoutLeftClick(Sender: TObject);
    procedure Layout8Click(Sender: TObject);
    procedure ListViewGruposItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ButtonBackProdutosClick(Sender: TObject);
    procedure ImageCarrinhoClick(Sender: TObject);
    procedure ButtonBackCarrinhoClick(Sender: TObject);
    procedure RoundRectConfirmarPedidoClick(Sender: TObject);
    procedure ImageGrid1Click(Sender: TObject);
    procedure ImageGrid2Click(Sender: TObject);
    procedure RoundRectBotaoConfirmarClick(Sender: TObject);
    procedure ListViewProdutosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Rectangle3Click(Sender: TObject);
    procedure Rectangle4Click(Sender: TObject);
    procedure Rectangle5Click(Sender: TObject);
    procedure TimerToastTimer(Sender: TObject);
    procedure TimerFecharToastTimer(Sender: TObject);
    procedure TimerToastMenuTimer(Sender: TObject);
    procedure TimerFecharToastMenuTimer(Sender: TObject);
    procedure ListViewCarrinhoDeletingItem(Sender: TObject; AIndex: Integer;
      var ACanDelete: Boolean);
    procedure RoundRectFinalizarPedidoClick(Sender: TObject);
    procedure ImageGrid5Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ButtonBackClientesClick(Sender: TObject);
    procedure ButtonBackPagamentoClick(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure ListBoxItemCadastrarProdutosClick(Sender: TObject);
    procedure ListBoxItemCadastrarGruposClick(Sender: TObject);
    procedure ListBoxItemCadastrarUsuariosClick(Sender: TObject);
    procedure ListBoxItemConfiguracoesClick(Sender: TObject);
    procedure ImageGrid3Click(Sender: TObject);
    procedure ImageGrid4Click(Sender: TObject);
    procedure ListBoxItemRelatoriosClick(Sender: TObject);
    procedure ComboBoxUsuarioClick(Sender: TObject);
    procedure ListBoxItemSairClick(Sender: TObject);
  private
    { Private declarations }
    FListItemProduto    : TListViewItem;
    FListItemGrupo      : TListViewItem;
    FListItemCarrinho   : TListViewItem;
    FTipoVenda          : TTypeTipoVenda;
    FTipoPagamento      : TTypeTipoPagamento;
    procedure FecharDialogsDeValoresESenha;
    procedure DoClickSenhaConfirmar(Sender: TObject);
    procedure DoClickSenhaCancelar(Sender: TObject);
    procedure DoClickConfirmacaoProduto(Sender: TObject);
    procedure DoClickCancelarConfirmacaoProduto(Sender: TObject);
    procedure DoClickFiscal(Sender: TObject);
    procedure DoClickGerente(Sender: TObject);
    procedure DoClickAberturaCaixa(Sender: TObject);
    procedure DoClickAberturaCaixaCancelar(Sender: TObject);
    procedure FecharTelaConfirmacaoProduto;
    procedure ConfigurarFramePedirSenha(ATitle: string; ATextConfirm: string; ATextCancel: string);
    procedure MarcarRadionDinheiro;
    procedure MarcarRadioDebito;
    procedure MarcarRadioCredito;
    procedure BuscarProdutos(const AItem: TListViewItem);
    procedure BuscarGrupos;
    procedure PreencherListViewProdutos;
    procedure PreencherListViewGrupos;
    procedure AbrirToast(AType: TTypeToastMessage);
    procedure ToastProdutoLan�ado;
    procedure ToastTelaDeMenu(AMessage: String);
    procedure SomarValorPago(AValor: Currency);
    procedure CalcularTroco;
    procedure VerificarFormaDePagamento;
    procedure FinalizarVenda;
    procedure FinalizarDevolucao;
    procedure LimparConteudoDeVenda;
    procedure VoltarAbas;
    procedure DevolucaoDeItem;
    procedure AbrirCadastroDeProdutos;
    procedure AbrirCadastroDeGrupos;
    procedure AbrirCadastroDeUsuarios;
    procedure AbrirRelatorios;
    procedure AbrirConfiguracoes;
    procedure CriarFramePedirSenha;
    procedure PedirSenhaFiscal;
    procedure PreencherUsuarioComboBox;
    procedure BuscarUsuarios;
    procedure ValidacaoTabLoginOuMenuAtiva;
    procedure HideVirtualKeyboardForm;
  public
    { Public declarations }
    FToast                  : TTypeToastMessage;
    FFrameAberturaCaixa     : TFrameViewAberturaCaixa;
    FFrameSenha             : TFrameViewPedirSenha;
    FFrameConfirmacaoProduto: TFrameConfirmacaoProduto;
    FOperacoesSistema       : TTypePermissoesUsuario;
    FCaixa                  : iControllerCaixa;
    FVenda                  : iControllerVenda;
    FUsuario                : iModelUsuario;
    FPermissoes             : iModelPermissoes;
    FTipoPedido             : TTypeTipoPedido;
    FTabs                   : TTypeTabs;
    FTabQueChamou           : TTypeTabs;
    procedure ExibirFormSenha(ATitle, ATextConfirm, ATextCancel: String;
  AChamada: TTypeTipoUsuario; AOperacoesSistema: TTypePermissoesUsuario);
    procedure MudarAba(ATabControl: TTabControl; ATypeTabs: TTypeTabs ; AProximaTabItem: TTabItem);
  end;

var
  Form3: TForm3;

implementation

uses
  MFichas.Controller.Venda,
  MFichas.Model.Permissoes,
  MFichas.View.Cadastros.Usuarios,
  MFichas.View.Configuracoes,
  qdac_fmx_vkhelper__;

{$R *.fmx}

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
begin
  SomarValorPago(100);
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  SomarValorPago(50);
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  SomarValorPago(20);
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  SomarValorPago(10);
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
  SomarValorPago(5);
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
  SomarValorPago(2);
end;

procedure TForm3.Button7Click(Sender: TObject);
begin
  SomarValorPago(1);
end;

procedure TForm3.Button8Click(Sender: TObject);
begin
  LabelValorPago.Text := FormatCurr('#,##0.00', 0.00);
  LabelTroco.Text     := FormatCurr('#,##0.00', 0.00);
end;

procedure TForm3.ButtonBackCarrinhoClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TForm3.ButtonBackClientesClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TForm3.ButtonBackPagamentoClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TForm3.ButtonBackProdutosClick(Sender: TObject);
begin
  VoltarAbas;
end;

procedure TForm3.CalcularTroco;
var
  LValorPago : Currency;
  LValorTotal: Currency;
begin
  LValorPago  := StrToFloat(LabelValorPago.Text.Replace('.',''));
  LValorTotal := StrToCurr(LabelValorTotal.Text.Replace('.',''));

  if  LValorPago > LValorTotal  then
    LabelTroco.Text :=
      FormatCurr(
        '#,##0.00',
        StrToFloat(
          LabelValorPago.Text.Replace('.', '')
        )
        -
        StrToFloat(
          LabelValorTotal.Text.Replace('.', '')
        )
      );
end;

procedure TForm3.ComboBoxUsuarioClick(Sender: TObject);
var
  LSelected  : String;
  LDropDown  : Boolean;
begin
  if (ComboBoxUsuario.Items.Count > 0) and (ComboBoxUsuario.ItemIndex >= 0) then
    LSelected := ComboBoxUsuario.Items.Strings[ComboBoxUsuario.ItemIndex];

  if ComboBoxUsuario.Items.Count = 0 then
    LDropDown := True;

  BuscarUsuarios;

  if not LSelected.IsNullOrWhiteSpace(LSelected) then
    ComboBoxUsuario.ItemIndex := ComboBoxUsuario.Items.IndexOf(LSelected);

  if LDropDown then
    ComboBoxUsuario.DropDown;
end;

procedure TForm3.ConfigurarFramePedirSenha(ATitle, ATextConfirm,
  ATextCancel: string);
begin
  FFrameSenha                                   := TFrameViewPedirSenha.Create(nil);
  FFrameSenha.Parent                            := Self;
  FFrameSenha.ConfigurarTamanhoDoModal(Self);
  FFrameSenha.LabelTitulo.Text                  := ATitle;
  FFrameSenha.LabelBotaoConfirmar.Text          := ATextConfirm;
  FFrameSenha.LabelBotaoCancelar.Text           := ATextCancel;
end;

procedure TForm3.DoClickAberturaCaixa(Sender: TObject);
begin
  FCaixa
  .Metodos
    .AbrirCaixa
  .&End;
end;

procedure TForm3.DoClickAberturaCaixaCancelar(Sender: TObject);
begin
  {$IFDEF MSWINDOWS}
  FreeAndNil(FFrameAberturaCaixa);
  {$ELSE}
  Form3.FFrameAberturaCaixa.Visible := False;
  Form3.FFrameAberturaCaixa.DisposeOf;
  Form3.FFrameAberturaCaixa.Free;
  {$ENDIF}
end;

procedure TForm3.DoClickCancelarConfirmacaoProduto(Sender: TObject);
begin
  FecharTelaConfirmacaoProduto;
end;

procedure TForm3.DoClickConfirmacaoProduto(Sender: TObject);
var
  LQuantidade: Currency;
  LValorTotal: Currency;
begin
  case FTipoVenda of
    tvVenda:     begin
                   FVenda
                   .Metodos
                     .VenderItem
                       .Codigo(ListViewProdutos.Items.AppearanceItem[ListViewProdutos.ItemIndex].Detail)
                       .Quantidade(FFrameConfirmacaoProduto.EditQuantidade.Text.ToDouble)
                       .Valor(FFrameConfirmacaoProduto.ValorOriginalDoProduto.ToDouble)
                     .Executar
                   .&End;
                 end;

    tvDevolucao: begin
                   FVenda
                   .Metodos
                     .DevolverItem
                       .Codigo(ListViewProdutos.Items.AppearanceItem[ListViewProdutos.ItemIndex].Detail)
                       .Quantidade(FFrameConfirmacaoProduto.EditQuantidade.Text.ToDouble)
                       .Valor(FFrameConfirmacaoProduto.ValorOriginalDoProduto.ToDouble)
                     .Executar
                   .&End;
                 end;
  end;

  LQuantidade :=  FFrameConfirmacaoProduto.EditQuantidade.Text.ToDouble;
  LValorTotal := (FFrameConfirmacaoProduto.ValorOriginalDoProduto.ToDouble * FFrameConfirmacaoProduto.EditQuantidade.Text.ToDouble);

  FListItemCarrinho      := ListViewCarrinho.Items.Add;
  FListItemCarrinho.Text := FFrameConfirmacaoProduto.LabelDescricaoProduto.Text;
  FListItemCarrinho.Data[TMultiDetailAppearanceNames.Detail1] :=
    'Quantidade: ' +
    FormatCurr('#,##0.00', LQuantidade);
  FListItemCarrinho.Data[TMultiDetailAppearanceNames.Detail2] :=
    'Valor: R$ ' +
    FormatCurr(
      '#,##0.00', LValorTotal);

  LabelValorTotal.Text :=
  FormatCurr(
    '#,##0.00',
    StrToFloat(LabelValorTotal.Text.Replace('.', '')) + LValorTotal
  );

  AbrirToast(tmProdutoLancado);

  FTabs := tTabProdutos;

  {$IFDEF MSWINDOWS}
  FreeAndNil(FFrameConfirmacaoProduto);
  {$ELSE}
  FFrameConfirmacaoProduto.Visible := False;
  FFrameConfirmacaoProduto.Free;
  FFrameConfirmacaoProduto.DisposeOf;
  {$ENDIF}
end;

procedure TForm3.DoClickFiscal(Sender: TObject);
begin
  FCaixa
  .Metodos
    .AbrirCaixa
  .&End;
end;

procedure TForm3.DoClickGerente(Sender: TObject);
begin
  ShowMessage('Gerente');
end;

procedure TForm3.DoClickSenhaCancelar(Sender: TObject);
begin
  FecharDialogsDeValoresESenha;
end;

procedure TForm3.DoClickSenhaConfirmar(Sender: TObject);
begin
  if FFrameSenha.ComboBoxUsuario.ItemIndex < 0 then
    raise Exception.Create('Selecione um usu�rio.');

  FUsuario
  .Funcoes
    .ValidarUsuarioESenha
      .NomeDoUsuario(FFrameSenha.ComboBoxUsuario.Items.Strings[FFrameSenha.ComboBoxUsuario.ItemIndex])
      .Senha(FFrameSenha.EditSenha.Text)
    .&End
  .&End;

  case FOperacoesSistema of
    puCadastrarProdutos: begin
      FecharDialogsDeValoresESenha;
      AbrirCadastroDeProdutos;
    end;

    puCadastrarGrupos: begin
      FecharDialogsDeValoresESenha;
      AbrirCadastroDeGrupos;
    end;

    puCadastrarUsuarios: begin
      FecharDialogsDeValoresESenha;
      AbrirCadastroDeUsuarios;
    end;

    puAcessarRelatorios: begin
      FecharDialogsDeValoresESenha;
      AbrirRelatorios;
    end;

    puAcessarConfiguracoes: begin
      FecharDialogsDeValoresESenha;
      AbrirConfiguracoes;
    end;

    puExcluirProdutosPosImpressao: begin
      FecharDialogsDeValoresESenha;
      DevolucaoDeItem;
    end;

    else
      raise Exception.Create('Nenhuma opera��o de sistema informada.');
  end;

end;

procedure TForm3.ExibirFormSenha(ATitle, ATextConfirm, ATextCancel: String;
  AChamada: TTypeTipoUsuario; AOperacoesSistema: TTypePermissoesUsuario);
begin
  FOperacoesSistema := AOperacoesSistema;

  ConfigurarFramePedirSenha(ATitle, ATextConfirm, ATextCancel);
  case AChamada of
    tuFiscal: begin
                FFrameSenha.RoundRectBotaoConfirmar.OnClick := DoClickFiscal;
                FFrameSenha.RoundRectBotaoCancelar.OnClick  := DoClickSenhaCancelar;
              end;
    tuGerente:
      FFrameSenha.RoundRectBotaoConfirmar.OnClick := DoClickGerente;
  end;
  Abort;
end;

procedure TForm3.FecharDialogsDeValoresESenha;
begin
  {$IFDEF MSWINDOWS}
  if Assigned(FFrameSenha) then
  begin
    FFrameSenha.Visible := False;
    FreeAndNil(FFrameSenha);
  end;
  if Assigned(FFrameAberturaCaixa) then
  begin
    FFrameAberturaCaixa.Visible := False;
    FreeAndNil(FFrameAberturaCaixa);
  end;
  {$ELSE}
  if Assigned(FFrameSenha) then
  begin
    FFrameSenha.Visible := False;
    FFrameSenha.Free;
    FFrameSenha.DisposeOf;
  end;
  if Assigned(FFrameAberturaCaixa) then
  begin
    FFrameAberturaCaixa.Visible := False;
    FFrameAberturaCaixa.Free;
    FFrameAberturaCaixa.DisposeOf;
  end;
  {$ENDIF}
end;

procedure TForm3.FecharTelaConfirmacaoProduto;
begin
  {$IFDEF MSWINDOWS}
  FreeAndNil(FFrameConfirmacaoProduto);
  {$ELSE}
  FFrameConfirmacaoProduto.Visible := False;
  FFrameConfirmacaoProduto.Free;
  FFrameConfirmacaoProduto.DisposeOf;
  {$ENDIF}
  FTabs := tTabProdutos;
end;

procedure TForm3.FinalizarDevolucao;
begin
  FVenda.Metodos.Pagar;

  FVenda
  .Metodos
  .EfetuarPagamento
    .TipoDePagamento(FTipoPagamento)
    .TipoDaVenda(FTipoVenda)
    .ValorTotalDaCompra(StrToCurr(LabelValorTotal.Text.Replace('.','')))
  .&End;

  FVenda.Metodos.FinalizarVenda;

  MudarAba(TabControlPrincipal, tTabMenu, TabItemMenu);

  LimparConteudoDeVenda;

  AbrirToast(tmPedidoDevolvido);
end;

procedure TForm3.FinalizarVenda;
begin
  LabelPagamentoValorTotal.Text := LabelValorTotal.Text;
  MudarAba(TabControlPrincipal, tTabPagamento, TabItemPagamento);
  FVenda.Metodos.Pagar;
end;

procedure TForm3.PreencherListViewGrupos;
begin
  ListViewGrupos.Items.Clear;
  FDMemTableGrupos.First;
  while not FDMemTableGrupos.EOF do
  begin
    FListItemGrupo        := ListViewGrupos.Items.Add;
    FListItemGrupo.Text   := FDMemTableGrupos.FieldByName('DESCRICAO').AsString;
    FListItemGrupo.Detail := FDMemTableGrupos.FieldByName('GUUID').AsString;
    FDMemTableGrupos.Next;
  end;
end;

procedure TForm3.PreencherListViewProdutos;
begin
  ListViewProdutos.Items.Clear;
  FDMemTableProdutos.First;
  while not FDMemTableProdutos.EOF do
  begin
    FListItemProduto := ListViewProdutos.Items.Add;
    FListItemProduto.Text := FDMemTableProdutos.FieldByName('DESCRICAO').AsString;
    FListItemProduto.Data[TMultiDetailAppearanceNames.Detail1] := FDMemTableProdutos.FieldByName('PRECO').AsString;
    FListItemProduto.Detail := FDMemTableProdutos.FieldByName('GUUID').AsString;
    FDMemTableProdutos.Next;
  end;
end;

procedure TForm3.Rectangle3Click(Sender: TObject);
begin
  MarcarRadionDinheiro;
end;

procedure TForm3.Rectangle4Click(Sender: TObject);
begin
  MarcarRadioDebito;
end;

procedure TForm3.Rectangle5Click(Sender: TObject);
begin
  MarcarRadioCredito;
end;

procedure TForm3.RoundRectBotaoConfirmarClick(Sender: TObject);
begin
  if ComboBoxUsuario.ItemIndex < 0 then
    raise Exception.Create('Selecione um usu�rio.');

  FUsuario
  .Funcoes
    .ValidarUsuarioESenha
      .NomeDoUsuario(ComboBoxUsuario.Items.Strings[ComboBoxUsuario.ItemIndex])
      .Senha(EditSenha.Text)
    .&End
  .&End;

  FCaixa
  .Metodos
    .AbrirCaixa
  .&End;
end;

procedure TForm3.RoundRectConfirmarPedidoClick(Sender: TObject);
begin
  if ListViewCarrinho.Items.Count <= 0 then
    raise Exception.Create(
      'Para prosseguir, adicione pelo menos 1 produto no carrinho.'
    );
  case FTipoVenda of
    tvVenda    : FinalizarVenda;
    tvDevolucao: FinalizarDevolucao;
  end;
end;

procedure TForm3.RoundRectFinalizarPedidoClick(Sender: TObject);
begin
  VerificarFormaDePagamento;

  FVenda
  .Metodos
  .EfetuarPagamento
    .TipoDePagamento(FTipoPagamento)
    .TipoDaVenda(FTipoVenda)
    .ValorTotalDaCompra(StrToCurr(LabelPagamentoValorTotal.Text.Replace('.','')))
  .&End;

  FVenda.Metodos.FinalizarVenda;

  MudarAba(TabControlPrincipal, tTabMenu, TabItemMenu);

  LimparConteudoDeVenda;

  AbrirToast(tmPedidoRealizado);
end;

procedure TForm3.SomarValorPago(AValor: Currency);
begin
  LabelValorPago.Text := FormatCurr('#,##0.00', StrToCurr(LabelValorPago.Text.Replace('.','')) + AValor);
  CalcularTroco;
end;

procedure TForm3.AbrirCadastroDeGrupos;
begin
  MultiView.HideMaster;
  if not Assigned(CadastroGrupoProdutoView) then
    Application.CreateForm(TCadastroGrupoProdutoView, CadastroGrupoProdutoView);
  {$IFDEF MSWINDOWS}
  try
    CadastroGrupoProdutoView.ShowModal;
  finally
    FreeAndNil(CadastroGrupoProdutoView);
  end;
  {$ELSE}
  CadastroGrupoProdutoView.Show;
  {$ENDIF}
end;

procedure TForm3.AbrirCadastroDeProdutos;
begin
  MultiView.HideMaster;
  if not Assigned(CadastroProdutoView) then
    Application.CreateForm(TCadastroProdutoView, CadastroProdutoView);
  {$IFDEF MSWINDOWS}
  try
    CadastroProdutoView.ShowModal;
  finally
    FreeAndNil(CadastroProdutoView);
  end;
  {$ELSE}
  CadastroProdutoView.Show;
  {$ENDIF}
end;

procedure TForm3.AbrirCadastroDeUsuarios;
begin
  MultiView.HideMaster;
  if not Assigned(CadastrosUsuariosView) then
    Application.CreateForm(TCadastrosUsuariosView, CadastrosUsuariosView);
  {$IFDEF MSWINDOWS}
  try
    CadastrosUsuariosView.ShowModal;
  finally
    FreeAndNil(CadastrosUsuariosView);
  end;
  {$ELSE}
  CadastrosUsuariosView.Show;
  {$ENDIF}
end;

procedure TForm3.AbrirConfiguracoes;
begin
  MultiView.HideMaster;
  if not Assigned(ConfiguracoesView) then
    Application.CreateForm(TConfiguracoesView, ConfiguracoesView);
  {$IFDEF MSWINDOWS}
  try
    ConfiguracoesView.ShowModal;
  finally
    FreeAndNil(ConfiguracoesView);
  end;
  {$ELSE}
  ConfiguracoesView.Show;
  {$ENDIF}
end;

procedure TForm3.AbrirRelatorios;
begin
  MultiView.HideMaster;
  if not Assigned(RelatorioView) then
    Application.CreateForm(TRelatorioView, RelatorioView);
  {$IFDEF MSWINDOWS}
  try
    RelatorioView.ShowModal;
  finally
    FreeAndNil(RelatorioView);
  end;
  {$ELSE}
  RelatorioView.Show;
  {$ENDIF}
end;

procedure TForm3.AbrirToast(AType: TTypeToastMessage);
begin
  case AType of
    tmProdutoLancado : ToastProdutoLan�ado;
    tmPedidoRealizado: ToastTelaDeMenu('Pedido efetuado com sucesso.');
    tmPedidoDevolvido: ToastTelaDeMenu('Pedido devolvido com sucesso.');
  end;
end;

procedure TForm3.BuscarGrupos;
begin
  TModelGrupoProduto.New
  .Metodos
    .Buscar
      .FDMemTable(FDMemTableGrupos)
      .BuscarTodosAtivos
    .&End
  .&End;

  PreencherListViewGrupos;
end;

procedure TForm3.BuscarProdutos(const AItem: TListViewItem);
begin
  TModelProduto.New
  .Metodos
    .BuscarView
      .FDMemTable(FDMemTableProdutos)
      .BuscarPorGrupo(AItem.Detail)
    .&End
  .&End;

  PreencherListViewProdutos;
end;

procedure TForm3.MarcarRadioCredito;
begin
  RadioButtonCredito.IsChecked := True;
end;

procedure TForm3.MarcarRadioDebito;
begin
  RadioButtonDebito.IsChecked := True;
end;

procedure TForm3.MarcarRadionDinheiro;
begin
  RadioButtonDinheiro.IsChecked := True;

end;

procedure TForm3.MudarAba(ATabControl: TTabControl; ATypeTabs: TTypeTabs;
  AProximaTabItem: TTabItem);
begin
  ATabControl.ActiveTab := AProximaTabItem;
  FTabs                 := ATypeTabs;
end;

procedure TForm3.ValidacaoTabLoginOuMenuAtiva;
begin
  if (TabControlPrincipal.ActiveTab <> TabItemLogin) and (TabControlPrincipal.ActiveTab <> TabItemMenu) then
    raise Exception.Create('Esse item s� pode ser acessado se voc� estiver na tela de LOGIN ou MENU.');
end;

procedure TForm3.BuscarUsuarios;
begin
  TModelUsuario.New
  .Funcoes
    .Buscar
      .FDMemTable(FDMemTableUsuarios)
      .BuscarTodosAtivos
    .&End
  .&End;

  PreencherUsuarioComboBox;
end;

procedure TForm3.PreencherUsuarioComboBox;
begin
  ComboBoxUsuario.Clear;
  FDMemTableUsuarios.First;
  ComboBoxUsuario.BeginUpdate;
  while not FDMemTableUsuarios.EOF do
  begin
    ComboBoxUsuario.Items.Add(FDMemTableUsuarios.FieldByName('LOGIN').AsString.ToUpper);
    FDMemTableUsuarios.Next;
  end;
  ComboBoxUsuario.EndUpdate;
end;

procedure TForm3.PedirSenhaFiscal;
begin
  CriarFramePedirSenha;
  FFrameSenha.LabelTitulo.Text                := 'Digite a senha de fiscal.';
  FFrameSenha.LabelBotaoConfirmar.Text        := 'Confirmar';
  FFrameSenha.LabelBotaoCancelar.Text         := 'Cancelar';
  FFrameSenha.PreencherUsuariosFiscaisNoComboBox;
  FFrameSenha.RoundRectBotaoConfirmar.OnClick := DoClickSenhaConfirmar;
  FFrameSenha.RoundRectBotaoCancelar.OnClick  := DoClickSenhaCancelar;
end;

procedure TForm3.CriarFramePedirSenha;
begin
  FFrameSenha        := TFrameViewPedirSenha.Create(nil);
  FFrameSenha.Parent := Form3;
  FFrameSenha.ConfigurarTamanhoDoModal(Form3);
end;

procedure TForm3.DevolucaoDeItem;
begin
  BuscarGrupos;
  FTipoPedido := tpDevolucao;
  FTipoVenda  := tvDevolucao;
  FVenda.Metodos.AbrirVenda;
  MudarAba(TabControlPrincipal, tTabGrupos, TabItemGrupos);
end;

procedure TForm3.TimerFecharToastMenuTimer(Sender: TObject);
begin
  RectangleToastMenu.Visible   := False;
  TimerToastMenu.Enabled       := False;
  TimerFecharToastMenu.Enabled := False;
end;

procedure TForm3.TimerFecharToastTimer(Sender: TObject);
begin
  RectangleToast.Visible   := False;
  TimerToast.Enabled       := False;
  TimerFecharToast.Enabled := False;
end;

procedure TForm3.TimerToastMenuTimer(Sender: TObject);
begin
  FloatAnimationToastMenu.Enabled    := False;
  FloatAnimationToastMenu.StartValue := 0.6;
  FloatAnimationToastMenu.StopValue  := 0;
  FloatAnimationToastMenu.Enabled    := True;
  TimerFecharToastMenu.Enabled           := True;
end;

procedure TForm3.TimerToastTimer(Sender: TObject);
begin
  FloatAnimationToast.Enabled    := False;
  FloatAnimationToast.StartValue := 0.6;
  FloatAnimationToast.StopValue  := 0;
  FloatAnimationToast.Enabled    := True;
  TimerFecharToast.Enabled       := True;
end;

procedure TForm3.ToastTelaDeMenu(AMessage: String);
begin
  RectangleToastMenu.Width           := LabelToastMenu.Width + 12;
  LabelToastMenu.Text                := AMessage;
  FloatAnimationToastMenu.Enabled    := False;
  RectangleToastMenu.Opacity         := 0;
  RectangleToastMenu.Visible         := True;
  FloatAnimationToastMenu.StartValue := 0;
  FloatAnimationToastMenu.StopValue  := 0.6;
  FloatAnimationToastMenu.Enabled    := True;
  TimerToastMenu.Enabled             := True;
end;

procedure TForm3.ToastProdutoLan�ado;
begin
  RectangleToast.Width           := LabelToast.Width + 12;
  FloatAnimationToast.Enabled    := False;
  RectangleToast.Opacity         := 0;
  RectangleToast.Visible         := True;
  FloatAnimationToast.StartValue := 0;
  FloatAnimationToast.StopValue  := 0.6;
  FloatAnimationToast.Enabled    := True;
  TimerToast.Enabled             := True;
end;

procedure TForm3.VerificarFormaDePagamento;
begin
  if RadioButtonDinheiro.IsChecked then
    FTipoPagamento := tpDinheiro
  else if RadioButtonDebito.IsChecked then
    FTipoPagamento := tpCartaoDebito
  else if RadioButtonCredito.IsChecked then
    FTipoPagamento := tpCartaoCredito
  else
    raise Exception.Create(
      'Por favor, para finalizar a venda selecione uma forma de pagamento.'
    );
end;

procedure TForm3.VoltarAbas;
begin
  case FTabs of
    tTabLogin:              begin

                            end;

    tTabMenu:               begin
                              raise Exception.Create(
                                'Para voltar para tela de login, � preciso FECHAR o caixa.'
                              );
                            end;

    tTabGrupos:             begin
                              raise Exception.Create(
                                'Para sair deste pedido � preciso finaliza-lo.'
                              );
                            end;

    tTabProdutos:           begin
                              MudarAba(TabControlPrincipal, tTabGrupos, TabItemGrupos);
                            end;

    tTabConfirmacaoProduto: begin
                              FecharTelaConfirmacaoProduto;
                            end;

    tTabCarrinho:           begin
                              if FTabQueChamou = tTabGrupos then
                                MudarAba(TabControlPrincipal, tTabGrupos, TabItemGrupos)
                              else
                                MudarAba(TabControlPrincipal, tTabProdutos, TabItemProdutos);
                            end;

    tTabPagamento:          begin
                              MudarAba(TabControlPrincipal, tTabCarrinho, TabItemCarrinho);
                            end;

    tTabCapturaValor:       begin
                              FTabs := FTabQueChamou;
                              FecharDialogsDeValoresESenha;
                            end;
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin

  TabControlPrincipal.TabPosition := TTabPosition.None;
  TabControlPrincipal.ActiveTab   := TabItemLogin;
  FCaixa                      := TControllerCaixa.New;
  FVenda                      := TControllerVenda.New(FCaixa);
  FPermissoes                 := TModelPermissoes.New;
  FUsuario                    := TModelUsuario.New;
  FTabs                       := tTabLogin;
  RectangleToast.Visible      := False;
  RectangleToastMenu.Visible  := False;
  ReportMemoryLeaksOnShutdown := true;
end;

procedure TForm3.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
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

procedure TForm3.HideVirtualKeyboardForm;
{$IFDEF ANDROID}
var
  TextView: JFMXTextEditorProxy;
{$ENDIF}
begin
{$IFDEF IOS}
  try
    Screen.ActiveForm.Focused := nil;
  except
  end;
{$ENDIF}
{$IFDEF Android}
  try
    begin
      TextView := MainActivity.getTextEditorProxy;
      CallInUIThread(
        procedure
        begin
          TextView.setFocusable(false);
          TextView.setFocusableInTouchMode(false);
          TextView.showSoftInput(false);
          TextView.clearFocus;
          TextView.setFocusable(true);
          TextView.setFocusableInTouchMode(true);
        end);
    end
  except
  end;
{$ENDIF}
end;

procedure TForm3.Image1Click(Sender: TObject);
begin
  MarcarRadionDinheiro;
end;

procedure TForm3.Image2Click(Sender: TObject);
begin
  MarcarRadioDebito;
end;

procedure TForm3.Image3Click(Sender: TObject);
begin
  MarcarRadioCredito;
end;

procedure TForm3.Image4Click(Sender: TObject);
begin
  MudarAba(TabControlPrincipal, tTabCarrinho, TabItemCarrinho);
  FTabQueChamou := tTabGrupos;
end;

procedure TForm3.ImageCarrinhoClick(Sender: TObject);
begin
  MudarAba(TabControlPrincipal, tTabCarrinho, TabItemCarrinho);
  FTabQueChamou := tTabProdutos;
end;

procedure TForm3.ImageGrid1Click(Sender: TObject);
begin
  BuscarGrupos;
  FTipoPedido := tpNovoPedido;
  FTipoVenda  := tvVenda;
  FVenda.Metodos.AbrirVenda;
  Form3.MudarAba(Form3.TabControlPrincipal, tTabGrupos, Form3.TabItemGrupos);
end;

procedure TForm3.ImageGrid2Click(Sender: TObject);
begin
  FOperacoesSistema := puExcluirProdutosPosImpressao;
  if TModelPermissoes.New.ListaDePermissoes.ExcluirProdutosPosImpressao = Integer(tuFiscal) then
  begin
    FTabs              := tTabCapturaValor;
    FTabQueChamou      := tTabMenu;
    PedirSenhaFiscal;
  end
  else
  begin
    DevolucaoDeItem;
  end;
end;

procedure TForm3.ImageGrid3Click(Sender: TObject);
begin
  FCaixa
  .Metodos
    .Suprimento
  .&End;
end;

procedure TForm3.ImageGrid4Click(Sender: TObject);
begin
  FCaixa
  .Metodos
    .Sangria
  .&End;
end;

procedure TForm3.ImageGrid5Click(Sender: TObject);
begin
  FCaixa.Metodos.FecharCaixa;
end;

procedure TForm3.Label2Click(Sender: TObject);
begin
  MarcarRadionDinheiro;
end;

procedure TForm3.Label3Click(Sender: TObject);
begin
  MarcarRadioDebito;
end;

procedure TForm3.Label4Click(Sender: TObject);
begin
  MarcarRadioCredito;
end;

procedure TForm3.Layout11Click(Sender: TObject);
begin
 MarcarRadionDinheiro;
end;

procedure TForm3.Layout8Click(Sender: TObject);
begin
  MarcarRadionDinheiro;
end;

procedure TForm3.LayoutLeftClick(Sender: TObject);
begin
  MarcarRadionDinheiro;
end;

procedure TForm3.LimparConteudoDeVenda;
begin
  LabelPagamentoValorTotal.Text := FormatCurr('#,##0.00', 0.00);
  LabelValorPago.Text           := FormatCurr('#,##0.00', 0.00);
  LabelTroco.Text               := FormatCurr('#,##0.00', 0.00);
  LabelValorTotal.Text          := FormatCurr('#,##0.00', 0.00);
  RadioButtonDinheiro.IsChecked := False;
  RadioButtonDebito.IsChecked   := False;
  RadioButtonCredito.IsChecked  := False;
  ListViewCarrinho.Items.Clear;
end;

procedure TForm3.ListBoxItemCadastrarGruposClick(Sender: TObject);
begin
  ValidacaoTabLoginOuMenuAtiva;

  FOperacoesSistema := puCadastrarGrupos;
  if FPermissoes.ListaDePermissoes.CadastrarGrupos = Integer(tuCaixa) then
    AbrirCadastroDeGrupos
  else
    PedirSenhaFiscal;
end;

procedure TForm3.ListBoxItemCadastrarProdutosClick(Sender: TObject);
begin
  ValidacaoTabLoginOuMenuAtiva;

  FOperacoesSistema := puCadastrarProdutos;
  if FPermissoes.ListaDePermissoes.CadastrarProdutos = Integer(tuCaixa) then
    AbrirCadastroDeProdutos
  else
    PedirSenhaFiscal;
end;

procedure TForm3.ListBoxItemCadastrarUsuariosClick(Sender: TObject);
begin
  ValidacaoTabLoginOuMenuAtiva;

  FOperacoesSistema := puCadastrarUsuarios;
  if FPermissoes.ListaDePermissoes.CadastrarUsuarios = Integer(tuCaixa) then
    AbrirCadastroDeUsuarios
  else
    PedirSenhaFiscal;
end;

procedure TForm3.ListBoxItemConfiguracoesClick(Sender: TObject);
begin
  FOperacoesSistema := puAcessarConfiguracoes;
  if FPermissoes.ListaDePermissoes.AcessarConfiguracoes = Integer(tuCaixa) then
    AbrirConfiguracoes
  else
    PedirSenhaFiscal;
end;

procedure TForm3.ListBoxItemRelatoriosClick(Sender: TObject);
begin
  FOperacoesSistema := puAcessarRelatorios;
  if FPermissoes.ListaDePermissoes.AcessarRelatorios = Integer(tuCaixa) then
    AbrirRelatorios
  else
    PedirSenhaFiscal;
end;

procedure TForm3.ListBoxItemSairClick(Sender: TObject);
begin
  TDialogService.MessageDialog('Deseja realmente sair do aplicativo?', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], System.UITypes.TMsgDlgBtn.mbYes, 0,
    procedure(const AResult: TModalResult)
      begin
        case AResult of
          mrYes: begin
                   {$IFDEF MSWINDOWS}
                     Application.Terminate;
                   {$ENDIF}
                   {$IFDEF ANDROID}
                     TAndroidHelper.Activity.finish;
                   {$ENDIF}
                 end;

          mrNo:  begin
                   Abort;
                 end;
        end;
      end);
end;

procedure TForm3.ListViewCarrinhoDeletingItem(Sender: TObject; AIndex: Integer;
  var ACanDelete: Boolean);
begin
  ACanDelete := False;

  FVenda
  .Metodos
  .CancelarItem
    .Index(AIndex)
    .Executar
  .&End;

  LabelValorTotal.Text :=
    FormatCurr('#,##0.00',
      StrToFloat(
        LabelValorTotal.Text.Replace('.', '')
      )
      -
      StrToFloat(
        ListViewCarrinho
        .Items[AIndex]
        .Data[TMultiDetailAppearanceNames.Detail2].AsString
        .Replace('.', '')
        .Replace('Valor: R$ ', '')
      )
    );

  ACanDelete := True;
end;

procedure TForm3.ListViewGruposItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  BuscarProdutos(AItem);
  MudarAba(TabControlPrincipal, tTabProdutos, TabItemProdutos);
end;

procedure TForm3.ListViewProdutosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FFrameConfirmacaoProduto := TFrameConfirmacaoProduto.Create(nil);
  FFrameConfirmacaoProduto.ValorOriginalDoProduto :=
    AItem.Data[TMultiDetailAppearanceNames.Detail1].AsString;
  FFrameConfirmacaoProduto.LabelDescricaoProduto.Text :=
    AItem.Text;
  FFrameConfirmacaoProduto.LabelValorProduto.Text :=
    AItem.Data[TMultiDetailAppearanceNames.Detail1].AsString;
  FFrameConfirmacaoProduto.ConfigurarTamanhoDoModal(Self);

  FFrameConfirmacaoProduto.RoundRectBotaoConfirmar.OnClick := DoClickConfirmacaoProduto;
  FFrameConfirmacaoProduto.RoundRectBotaoCancelar.OnClick := DoClickCancelarConfirmacaoProduto;

  FTabs := tTabConfirmacaoProduto;
end;

end.
