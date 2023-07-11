unit Regras.LucroReal;

interface

uses
  Regras.Interfaces,
  System.SysUtils;

type
  TRegraLucroReal = class(TInterfacedObject, iRegras)
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
  Regras.Controller,
  Regras.Tipo,
  Regras.Operacoes,
  Regras.Parametros;

{ TRegraLucroReal }

constructor TRegraLucroReal.Create;
begin
  FParametros :=
  TRegraParametros
    .New(Self)
    .Name('Lucro Real')
    .PercentImposto(0.4)
    .PercentImpostoST(0.45)
    .PercentImpostoISS(0.14);
end;

destructor TRegraLucroReal.Destroy;
begin

  inherited;
end;

class function TRegraLucroReal.New: iRegras;
begin
  Result := Self.Create;
end;

function TRegraLucroReal.Operacoes: iRegrasOperacoes;
begin
  if not Assigned(FOperacoes) then
    FOperacoes := TRegraOperacoes.New(Self);

  Result := FOperacoes;
end;

function TRegraLucroReal.Parametros: iRegrasParametros;
begin
  if not Assigned(FParametros) then
    FParametros := TRegraParametros.New(Self);

  Result := FParametros;
end;

initialization
  TRegraController.New.Registry(Integer(trReal), 'Lucro Real');

end.
