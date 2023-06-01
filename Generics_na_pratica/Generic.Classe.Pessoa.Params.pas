unit Generic.Classe.Pessoa.Params;

interface

type
  TParams<T : class> = class
    private
    FTelefone : String;
    FEndereco : String;
    FCEP : String;
    FParent : T;
    public
      constructor Create ( aParent : T ) ;
      destructor Destroy; override;
      function Telefone ( aValue : String ): TParams<T>; overload;
      function Telefone: String; overload;
      function Endereco ( aValue : String ): TParams<T>; overload;
      function Endereco: String; overload;
      function CEP ( aValue : String ): TParams<T>; overload;
      function CEP : String; overload;
      function &End : T;

//      function Display
  end;

implementation

{ TParams }

function TParams<T>.CEP(aValue: String): TParams<T>;
begin
  Result := Self;
  FCEP := aValue;
end;

function TParams<T>.&End: T;
begin
  Result := FParent;
end;

function TParams<T>.CEP: String;
begin
  Result := FCEP;
end;

constructor TParams<T>.Create( aParent : T );
begin
  FParent := aParent;
end;

destructor TParams<T>.Destroy;
begin

  inherited;
end;

function TParams<T>.Endereco(aValue: String): TParams<T>;
begin
  Result := Self;
  FEndereco := aValue;
end;

function TParams<T>.Endereco: String;
begin
  Result := FEndereco;
end;

function TParams<T>.Telefone(aValue: String): TParams<T>;
begin
  Result := Self;
  FTelefone := aValue;
end;

function TParams<T>.Telefone: String;
begin
  Result := FTelefone;
end;

end.
