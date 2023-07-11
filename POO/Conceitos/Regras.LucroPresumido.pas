unit Regras.LucroPresumido;

interface

uses
  Regras.Interfaces,
  System.SysUtils;

type
  TRegraLucroPresumido = class(TInterfacedObject, iRegras)
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
  Regras.Controller, Regras.Tipo, Regras.Operacoes, Regras.Parametros;

{ TRegraLucroPresumido }


constructor TRegraLucroPresumido.Create;
begin
  FParametros :=
  TRegraParametros
    .New(Self)
    .Name('Lucro Presumido')
    .PercentImposto(0.3)
    .PercentImpostoST(0.65)
    .PercentImpostoISS(0.12);
end;

destructor TRegraLucroPresumido.Destroy;
begin

  inherited;
end;

class function TRegraLucroPresumido.New: iRegras;
begin
  Result := Self.Create;
end;

function TRegraLucroPresumido.Operacoes: iRegrasOperacoes;
begin
  if not Assigned(FOperacoes) then
    FOperacoes := TRegraOperacoes.New(Self);

  Result := FOperacoes;
end;

function TRegraLucroPresumido.Parametros: iRegrasParametros;
begin
  if not Assigned(FParametros) then
    FParametros := TRegraParametros.New(Self);

  Result := FParametros;
end;

initialization
  TRegraController.New.Registry(Integer(trPresumido), 'Lucro Presumido');

end.
