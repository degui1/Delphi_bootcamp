unit Generic.Classe.Pessoa;

interface

uses
  Generic.classe.Interfaces, Generic.Classe.Pessoa.Params;

type

  TPessoa = class(TInterfacedObject, iPessoa<TPessoa>)
  private
    FNome: String;
    FParams: TParams<TPessoa>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iPessoa<TPessoa>;
    function Nome ( aValue : String ): iPessoa<TPessoa>;
    function Params : TParams<TPessoa>;
    function Cadastro: String;
  end;

implementation

{ TPessoa }

function TPessoa.Cadastro: String;
begin
  Result :=
    FNome + ' - ' +
    FParams.Telefone + ' - ' +
    FParams.Endereco + ' - ' +
    FParams.CEP;
end;

constructor TPessoa.Create;
begin
  FParams := TParams<TPessoa>.Create(Self);
end;

destructor TPessoa.Destroy;
begin
  FParams.Free;
  inherited;
end;

class function TPessoa.New: iPessoa<TPessoa>;
begin
  Result := Self.Create;
end;

function TPessoa.Nome(aValue: String): iPessoa<TPessoa>;
begin
  Result := Self;
  FNome := aValue;
end;

function TPessoa.Params: TParams<TPessoa>;
begin
  Result := FParams;
end;

end.
