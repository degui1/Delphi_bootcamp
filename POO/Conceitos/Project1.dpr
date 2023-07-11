program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Regras.SimplesNacional in 'Regras.SimplesNacional.pas',
  Regras.LucroPresumido in 'Regras.LucroPresumido.pas',
  Regras.LucroReal in 'Regras.LucroReal.pas',
  Regras.Tipo in 'Regras.Tipo.pas',
  Regras.Controller in 'Regras.Controller.pas',
  Regras.Interfaces in 'Regras.Interfaces.pas',
  Regras.Operacoes in 'Regras.Operacoes.pas',
  Regras.Parametros in 'Regras.Parametros.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
