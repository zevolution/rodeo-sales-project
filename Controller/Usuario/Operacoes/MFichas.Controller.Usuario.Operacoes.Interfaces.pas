unit MFichas.Controller.Usuario.Operacoes.Interfaces;

interface

uses
  MFichas.Controller.Types;

type
  iControllerUsuarioOperacoes           = interface;
  iControllerUsuarioOperacoesPedirSenha = interface;

  iControllerUsuarioOperacoes = interface
    ['{2E1ADF5A-9BC9-4297-9625-FB95253ACC9C}']
    function PedirSenha: iControllerUsuarioOperacoesPedirSenha;
  end;

  iControllerUsuarioOperacoesPedirSenha = interface
    ['{00484B27-FD89-4980-8B5C-E6FCCD58836C}']
    function SetTitle(ATitle: String)                 : iControllerUsuarioOperacoesPedirSenha;
    function SetTextConfirm(ATextConfirm: String)     : iControllerUsuarioOperacoesPedirSenha;
    function SetTextCancel(ATextCancel: String)       : iControllerUsuarioOperacoesPedirSenha;
    function SetChamada(AChamada: TTypeTipoUsuario): iControllerUsuarioOperacoesPedirSenha;
    function SetOperacao(AOperacao: TTypePermissoesUsuario): iControllerUsuarioOperacoesPedirSenha;
    function &End                                     : iControllerUsuarioOperacoesPedirSenha;
  end;

implementation

end.
