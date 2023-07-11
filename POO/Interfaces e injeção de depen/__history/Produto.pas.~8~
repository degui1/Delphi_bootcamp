unit Produto;

interface

uses
  DAO.RTTI;

type
  [TableName('TAB_PRODUTO')]
  TProduto = class
    private
    FDescricao: String;
    FNome: String;
    FID: Integer;
    procedure SetDescricao(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetID(const Value: Integer);
    public
      [FieldType(tpID)]
      property ID : Integer read FID write SetID;
      [FieldType(tpString)]
      property Nome : String read FNome write SetNome;
      [FieldType(tpString)]
      property Descricao : String read FDescricao write SetDescricao;
  end;

implementation

{ TProduto }

procedure TProduto.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TProduto.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TProduto.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
