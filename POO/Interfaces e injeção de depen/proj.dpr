program proj;

uses
  Vcl.Forms,
  unForm in 'unForm.pas' {Form1},
  DAO.Generic in 'DAO.Generic.pas',
  DAO.Interfaces in 'DAO.Interfaces.pas',
  Produto in 'Produto.pas',
  Pessoa in 'Pessoa.pas',
  DAO.RTTI in 'DAO.RTTI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
