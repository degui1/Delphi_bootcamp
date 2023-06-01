unit Generic.classe.Interfaces;

interface

uses
  Generic.Classe.Pessoa.Params;

type

  iPessoa<T : class> = interface
    function Nome ( aValue : String ): iPessoa<T>;
    function Params : TParams<T>;
    function Cadastro: String;
  end;

  iEmpresa<T : class> = interface
    function RazaoSocial ( aValue : String ): iEmpresa<T>;
    function Params : TParams<T>;
    function Cadastro: String;
  end;

implementation

end.
