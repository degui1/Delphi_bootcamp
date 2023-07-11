unit Regras.Tipo;

interface

uses
  Regras.Interfaces,
  Regras.LucroPresumido,
  Regras.LucroReal,
  Regras.SimplesNacional;

type
  TEnumRegras = (trSimples, trPresumido, trReal);

  TEnumRegrasHelper = record Helper for TEnumRegras
    function this : iRegras;
  end;

implementation

{ TEnumRegrasHelper }

function TEnumRegrasHelper.this: iRegras;
begin
  case Self of
    trSimples:    Result := TRegraSimplesNacional.Create;
    trPresumido:  Result := TRegraLucroPresumido.Create;
    trReal:       Result := TRegraLucroReal.Create;
  end;
end;

end.
