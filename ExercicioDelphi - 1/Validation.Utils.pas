unit Validation.Utils;

interface

uses
  interfaces, ValidationTypes;

type
  TValidation = class(TInterfacedObject, iValidation<TValidation>)
  private
    FNotNull : TNotNull<TValidation>;
    FMinLength : TMinLength<TValidation>;
    FMaxLength : TMaxLength<TValidation>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iValidation<TValidation>;
    function NotNull : TNotNull<TValidation>;
    function MinLength : TMinLength<TValidation>;
    function MaxLength : TMaxLength<TValidation>;
  end;

implementation

{ TValidation }

constructor TValidation.Create;
begin
  FNotNull := TNotNull<TValidation>.Create(Self);
  FMinLength := TMinLength<TValidation>.Create(Self);
  FMaxLength := TMaxLength<TValidation>.Create(Self);
end;

destructor TValidation.Destroy;
begin
  FNotNull.Free;
  FMinLength.Free;
  FMaxLength.Free;
  inherited;
end;

function TValidation.MaxLength: TMaxLength<TValidation>;
begin
  Result := FMaxLength;
end;

function TValidation.MinLength: TMinLength<TValidation>;
begin
  Result := FMinLength;
end;

class function TValidation.New: iValidation<TValidation>;
begin
  Result := Self.Create;
end;

function TValidation.NotNull: TNotNull<TValidation>;
begin
  Result := FNotNull;
end;

end.
