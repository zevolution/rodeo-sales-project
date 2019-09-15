unit MFichas.View.Dialog.PedirSenha;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.ListBox,

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

  MFichas.Model.Usuario;

type
  TFrameViewPedirSenha = class(TFrame)
    LayoutPrincipal: TLayout;
    RectanglePrincipal: TRectangle;
    LayoutRectangleTop: TLayout;
    LayoutRectangleClient: TLayout;
    LayoutRectangleBottom: TLayout;
    LabelTitulo: TLabel;
    LayoutDireita: TLayout;
    LayoutEsquerda: TLayout;
    RoundRectBotaoConfirmar: TRoundRect;
    RoundRectBotaoCancelar: TRoundRect;
    LabelBotaoConfirmar: TLabel;
    LabelBotaoCancelar: TLabel;
    LabelUsuario: TLabel;
    ComboBoxUsuario: TComboBox;
    Label1: TLabel;
    EditSenha: TEdit;
    RectangleSombra: TRectangle;
    FDMemTableUsuarios: TFDMemTable;
  private
    { Private declarations }
    procedure PreencherUsuariosNoComboBox;
  public
    { Public declarations }
    procedure ConfigurarTamanhoDoModal(AParent: TForm);
    procedure PreencherTodosUsuariosNoComboBox;
    procedure PreencherUsuariosFiscaisNoComboBox;
    procedure PreencherUsuariosGerentesNoComboBox;
  end;

implementation

{$R *.fmx}

{ TFrame1 }


{ TFrameViewPedirSenha }

procedure TFrameViewPedirSenha.ConfigurarTamanhoDoModal(AParent: TForm);
begin
  Self.Align                             := TAlignLayout.Contents;
  Self.Visible                           := False;
  Self.Parent                            := AParent;
  Self.RectanglePrincipal.Margins.Top    := AParent.Height / 4.5;
  Self.RectanglePrincipal.Margins.Bottom := AParent.Height / 4.5;
  Self.RectanglePrincipal.Margins.Left   := AParent.Width  / 10;
  Self.RectanglePrincipal.Margins.Right  := AParent.Width  / 10;
  Self.RectangleSombra.Visible           := True;
  Self.Visible                           := True;
end;


procedure TFrameViewPedirSenha.PreencherTodosUsuariosNoComboBox;
begin
  TModelUsuario.New
  .Funcoes
    .Buscar
      .FDMemTable(FDMemTableUsuarios)
      .BuscarTodosAtivos
    .&End
  .&End;
  PreencherUsuariosNoComboBox;
end;

procedure TFrameViewPedirSenha.PreencherUsuariosFiscaisNoComboBox;
begin
  TModelUsuario.New
  .Funcoes
    .Buscar
      .FDMemTable(FDMemTableUsuarios)
      .BuscarFiscais
    .&End
  .&End;
  PreencherUsuariosNoComboBox;
end;

procedure TFrameViewPedirSenha.PreencherUsuariosGerentesNoComboBox;
begin
  TModelUsuario.New
  .Funcoes
    .Buscar
      .FDMemTable(FDMemTableUsuarios)
      .BuscarProprietarios
    .&End
  .&End;
  PreencherUsuariosNoComboBox;
end;

procedure TFrameViewPedirSenha.PreencherUsuariosNoComboBox;
begin
  FDMemTableUsuarios.First;
  while not FDMemTableUsuarios.Eof do
  begin
    ComboBoxUsuario.Items.Add(FDMemTableUsuarios.FieldByName('LOGIN').AsString.ToUpper);
    FDMemTableUsuarios.Next;
  end;
end;

end.
