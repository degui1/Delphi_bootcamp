unit DAO.RTTI;

interface

uses
  System.RTTI, System.SysUtils;

type

  TAttrType = (tpString, tpInteger);

  TableName = class(TCustomAttribute)
    private
    FTableName: String;
    procedure SetTableName(const Value: String);
    public
      constructor Create ( aTableName : String );
      property TableName: String read FTableName write SetTableName;
  end;

  FieldType = class(TCustomAttribute)
    private
    FAttrType: TAttrType;
    procedure SetAttrType(const Value: TAttrType);
    public
      constructor Create ( aFieldType : TAttrType );
      property AttrType : TAttrType read FAttrType write SetAttrType;
  end;


  TDAORTTI = class
    private
    public
      class function getInsertSQL<T : class> ( aEntity: T ) : String;
  end;
implementation

{ TDAORTTI }

class function TDAORTTI.getInsertSQL<T>(aEntity: T): String;
var
  ctx : TRttiContext;
  _type : TRttiType;
  props : TRttiProperty;
  attr : TCustomAttribute;
  FTableName : String;
begin
  ctx := TRttiContext.Create;
  try
    _type := ctx.GetType(aEntity.ClassInfo);

    for attr in _type.GetAttributes do
        if attr is TableName then
          FTableName := TableName(attr).TableName;


    Result := 'INSERT INTO ' + FTableName + '(';

    for props in _Type.GetProperties do
    begin
      Result := Result + props.Name + ',';
    end;

    Result := Copy(Result, 0, Length(Result) -1);

    Result := Result + ') VALUES (';

    for props in _Type.GetProperties do
    begin
      for Attr in props.GetAttributes do
      begin
        if Attr is FieldType then
        begin
          case FieldType(attr).AttrType of
            tpInteger: Result := Result + (props.GetValue(Pointer(aEntity)).AsInteger).ToString + ',';
            tpString:  Result := Result + QuotedStr(props.GetValue(Pointer(aEntity)).AsString) + ',';
          end;
        end;
      end;
    end;

    Result := Copy(Result, 0, Length(Result) -1);

    Result := Result + ')';
  finally
    ctx.Free;
  end;
end;

{ TableName }

constructor TableName.Create(aTableName: String);
begin
  FTableName :=aTableName;
end;

procedure TableName.SetTableName(const Value: String);
begin
  FTableName := Value;
end;

{ FieldType }

constructor FieldType.Create(aFieldType: TAttrType);
begin
  FAttrType := aFieldType;
end;

procedure FieldType.SetAttrType(const Value: TAttrType);
begin
  FAttrType := Value;
end;

end.
