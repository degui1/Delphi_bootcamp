unit Pessoa;

interface

uses
  DAO.RTTI;

type
  [TableName('TAB_PESSOA')]
  TPessoa = class
    private
    Fidade: Integer;
    FNome: String;
    FSobrenome: String;
    FID: Integer;
    procedure Setidade(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetSobrenome(const Value: String);
    procedure SetID(const Value: Integer);
    public
      [FieldType(tpID)]
      property ID : Integer read FID write SetID;
      [FieldType(tpString)]
      property Nome : String read FNome write SetNome;
      [FieldType(tpInteger)]
      property idade : Integer read Fidade write Setidade;
      [FieldType(tpString)]
      property Sobrenome : String read FSobrenome write SetSobrenome;
  end;

implementation

{ TPessoa }

procedure TPessoa.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TPessoa.Setidade(const Value: Integer);
begin
  Fidade := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPessoa.SetSobrenome(const Value: String);
begin
  FSobrenome := Value;
end;

end.
