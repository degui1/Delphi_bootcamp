unit unForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Helpers;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  View.Pessoa;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit3.toText(Edit1.toInteger + Edit2.toInteger);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit3.currToBrl(2255);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ShowMessage(
    TEnumPessoa(ComboBox1.ItemIndex).This.Nome
  );
end;

end.
