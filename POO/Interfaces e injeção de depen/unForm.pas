unit unForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DAO.Interfaces, Pessoa,
  DAO.Generic, Produto;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    [TFormFields('Edit1')]
    Edit1: TEdit;
    [TFormFields('Edit2')]
    Edit2: TEdit;
    [TFormFields('Edit3')]
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    procedure Display ( aValue: String );
  public
    { Public declarations }
  end;

  var
    iDAOPessoa : iDAO<TPessoa>;
    iDAOProduto : iDAO<TProduto>;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  iDAOPessoa := TGenericDAO<TPessoa>.New;
  iDAOPessoa.Display(Display);
  iDAOPessoa.This.ID := 1;
  iDAOPessoa.This.Nome := 'Guilherme';
  iDAOPessoa.This.idade := 19;
  iDAOPessoa.This.Sobrenome := 'Goncalves';
  iDAOPessoa.insert;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  iDAOProduto := TGenericDAO<TProduto>.New;
  iDAOProduto.Display(Display);
  iDAOProduto.This.ID := 1;
  iDAOProduto.This.Nome := 'Coca-cola';
  iDAOProduto.This.Descricao := 'Produto 1';
  iDAOProduto.insert;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  iDAOPessoa.delete;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  iDAOProduto.delete;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  iDAOPessoa.Update(Self);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
//
end;

procedure TForm1.Display(aValue: String);
begin
  Memo1.Lines.Add(aValue);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
