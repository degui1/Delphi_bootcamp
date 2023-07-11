unit Regras.SimplesNacional;

interface

uses
  Regras.Interfaces, System.SysUtils, Regras.Operacoes;

type
  TRegraSimplesNacional = class(TInterfacedObject, iRegras)
    private
      FOperacoes : iRegrasOperacoes;
      FParametros : iRegrasParametros;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iRegras;
      function Parametros : iRegrasParametros;
      function Operacoes : iRegrasOperacoes;
  end;

implementation

uses
  Regras.Controller, Regras.Tipo, Regras.Parametros;

{ TRegraSimplesNacional }

constructor TRegraSimplesNacional.Create;
begin
  FParametros :=
  TRegraParametros
    .New(Self)
    .Name('Simples Nacional')
    .PercentImposto(0.2)
    .PercentImpostoST(0.95)
    .PercentImpostoISS(0.1);
end;

destructor TRegraSimplesNacional.Destroy;
begin

  inherited;
end;

class function TRegraSimplesNacional.New: iRegras;
begin
  Result := Self.Create;
end;

function TRegraSimplesNacional.Operacoes: iRegrasOperacoes;
begin
  if not Assigned(FOperacoes) then
    FOperacoes := TRegraOperacoes.New(Self);

  Result := FOperacoes;
end;

function TRegraSimplesNacional.Parametros: iRegrasParametros;
begin
  if not Assigned(FParametros) then
    FParametros := TRegraParametros.New(Self);

  Result := FParametros;
end;

initialization
  TRegraController.New.Registry(Integer(trSimples), 'Simples Nacional');

end.
