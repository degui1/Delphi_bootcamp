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
    procedure SetDescricao(const Value: String);
    procedure SetNome(const Value: String);
    public
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

procedure TProduto.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
