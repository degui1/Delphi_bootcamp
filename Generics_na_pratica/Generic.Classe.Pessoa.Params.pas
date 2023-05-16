unit Generic.Classe.Pessoa.Params;

interface

uses
  System.SysUtils;
type
  TPessoaParam<T : class> = class
    private
      FTelefone: String;
      FEndereco: String;
      FCEP: String;
      FNumero: Integer;
      FPlanoSaude: String;
      FParent: T;
      FDisplay: TProc<String>;
    public
      constructor Create ( aParent : T );
      destructor Destroy; override;
      function &End : T;
      function Telefone ( aValue : String ): TPessoaParam<T>; overload;
      function Telefone : String; overload;
      function Endereco (aValue: String): TPessoaParam<T>; overload;
      function Endereco : String; overload;
      function CEP (aValue: String): TPessoaParam<T>; overload;
      function CEP : String; overload;
      function Numero ( aValue : Integer): TPessoaParam<T>; overload;
      function Numero : Integer; overload;
      function PlanoSaude ( aValue : String ): TPessoaParam<T>; overload;
      function PlanoSaude : String; overload;

      function Display : TProc<String>; overload;
      function Display (aValue : TProc<string>) : TPessoaParam<T>; overload;
  end;
implementation

{ TPessoa }

function TPessoaParam<T>.CEP(aValue: String): TPessoaParam<T>;
begin
  Result := Self;
  FCEP := aValue;
end;

function TPessoaParam<T>.Endereco(aValue: String): TPessoaParam<T>;
begin
  Result := Self;
  FEndereco := aValue;
end;

function TPessoaParam<T>.Numero(aValue: Integer): TPessoaParam<T>;
begin
  Result := Self;
  FNumero := aValue;
end;

function TPessoaParam<T>.PlanoSaude(aValue: String): TPessoaParam<T>;
begin
  Result := Self;
  FPlanoSaude := aValue;
end;

function TPessoaParam<T>.Telefone(aValue: String): TPessoaParam<T>;
begin
  Result := Self;
  FTelefone := aValue;
end;

function TPessoaParam<T>.&End: T;
begin
  Result := FParent;
end;

function TPessoaParam<T>.CEP: String;
begin
  Result := FCEP;
end;

constructor TPessoaParam<T>.Create(aParent: T);
begin
  FParent := aParent;
end;

destructor TPessoaParam<T>.Destroy;
begin

  inherited;
end;

function TPessoaParam<T>.Display(aValue: TProc<string>): TPessoaParam<T>;
begin
  Result := self;
  FDisplay := aValue;
end;

function TPessoaParam<T>.Display: TProc<String>;
begin
  Result := FDisplay;
end;

function TPessoaParam<T>.Endereco: String;
begin
  Result := FEndereco;
end;

function TPessoaParam<T>.Numero: Integer;
begin
  Result := FNumero;
end;

function TPessoaParam<T>.PlanoSaude: String;
begin
  Result := FPlanoSaude;
end;

function TPessoaParam<T>.Telefone: String;
begin
  Result := FTelefone;
end;

end.