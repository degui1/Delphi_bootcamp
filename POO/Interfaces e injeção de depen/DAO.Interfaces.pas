unit DAO.Interfaces;

interface

uses
  System.SysUtils;

type

  iDAO<T : class> = interface
    ['{5D959BED-B3E5-4F84-8AC8-B443F15C83BA}']
    procedure update;
    procedure insert;
    procedure delete;
    procedure Display ( aValue : TProc<String>);
    function This : T;

  end;

implementation

end.
