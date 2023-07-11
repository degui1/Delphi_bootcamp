unit Regras.Interfaces;

interface

uses
  System.SysUtils,
  System.Classes;

type
  iRegrasOperacoes = interface;
  iRegrasParametros = interface;


  iRegrasController = interface
    ['{5B552B29-2809-464B-8DBA-87400B9D3B33}']
    function Registry ( aKey : Integer; aValue : String ) : iRegrasController;
    function ListaRegras (aValue : TStrings ) : iRegrasController;
  end;

  iRegras = interface
    ['{274E7FF1-6E24-49C9-911A-F4D6A5FF4F64}']
    function Parametros : iRegrasParametros;
    function Operacoes : iRegrasOperacoes;
  end;

  iRegrasParametros = interface
    ['{AD62576F-DE14-4532-A210-83BFFFC0D248}']
    function Name : String; overload;
    function Name ( aValue : String ) : iRegrasParametros; overload;
    function Display ( aValue : TProc<String> ) : iRegrasParametros; overload;
    function Display : TProc<String>; overload;
    function PercentImposto : Currency; overload;
    function PercentImposto ( aValue : Currency ) : iRegrasParametros; overload;
    function PercentImpostoST : Currency; overload;
    function PercentImpostoST ( aValue : Currency ) : iRegrasParametros; overload;
    function PercentImpostoISS : Currency; overload;
    function PercentImpostoISS ( aValue : Currency ) : iRegrasParametros; overload;
    function &End : iRegras;
  end;

  iRegrasOperacoes = interface
    ['{44ADAEDE-0412-4475-A427-44F021935C94}']
    function CalcularImposto ( aValue : Currency ) : Currency; overload;
    function CalcularImposto ( aValue : String ) : Currency; overload;
    function CalcularImpostoST ( aValue : Currency ) : Currency; overload;
    function CalcularImpostoST ( aValue : String ) : Currency; overload;
    function CalcularISS ( aValue : Currency ) : Currency; overload;
    function CalcularISS ( aValue : String ) : Currency; overload;
  end;

implementation

end.
