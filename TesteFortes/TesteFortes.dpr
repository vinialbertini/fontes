program TesteFortes;

{$R *.dres}

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fmPrincipal},
  uAbastecimento_Interface in 'uAbastecimento_Interface.pas',
  uAbastecimento in 'uAbastecimento.pas',
  UDM in 'UDM.pas' {dmConexao: TDataModule},
  uAbastecimentoController in 'uAbastecimentoController.pas',
  uRelatorio in 'uRelatorio.pas' {fmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfmRelatorio, fmRelatorio);
  Application.Run;
end.
