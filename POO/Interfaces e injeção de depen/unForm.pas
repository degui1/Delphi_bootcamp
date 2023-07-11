unit unForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DAO.Interfaces, Pessoa,
  DAO.Generic;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure Display ( aValue: String );
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Produto;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  iDAO : iDAO<TPessoa>;
begin
  iDAO := TGenericDAO<TPessoa>.New;
  iDAO.Display(Display);
  iDAO.This.Nome := 'Guilherme';
  iDAO.This.idade := 19;
  iDAO.This.Sobrenome := 'Goncalves';
  iDAO.insert;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  iDAO : iDAO<TProduto>;
begin
  iDAO := TGenericDAO<TProduto>.New;
  iDAO.Display(Display);
  iDAO.This.Nome := 'Coca-cola';
  iDAO.This.Descricao := 'Produto 1';
  iDAO.insert;
end;

procedure TForm1.Display(aValue: String);
begin
  Memo1.Lines.Add(aValue);
end;

end.
