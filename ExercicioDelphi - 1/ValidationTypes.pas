unit ValidationTypes;

interface

uses
  System.SysUtils, Vcl.StdCtrls, System.Classes;

type

  TNotifyEventWrapper = class(TComponent)
    private
      FProc : TProc<TObject>;
    public
      constructor Create ( Owner : TComponent; Proc : TProc<TObject>);
    published
      procedure Event ( Sender : TObject );
      class function AnonProcToNotifyEvent ( Owner : TComponent; Proc : TProc<TObject> ): TNotifyEvent;
  end;

  TNotNull<T : class> = class
    private
      FParent : T;
      FComponent : TEdit;
      FDisplay : TLabel;
    public
      constructor Create ( aParent : T );
      function Component ( aValue : TEdit ) : TNotNull<T>;
      function ColorDanger : TNotNull<T>;
      function DisplayComponent (aDisplay : TLabel ): TNotNull<T>;
      function DisplayMsgError ( aMsg : String ) : TNotNull<T>;
      function &End : T;
  end;

  TMinLength<T : class> = class
    private
      FParent : T;
    public
      constructor Create ( aParent : T );
      function Component ( aValue : T ) : TNotNull<T>;
      function ColorDanger ( aColor : String ) : TNotNull<T>;
      function DisplayComponent<x> ( aDisplay : x ) : TNotNull<T>;
      function &End : T;
  end;

  TMaxLength<T : class> = class
    private
      FParent : T;
    public
      constructor Create ( aParent : T );
      function Component ( aValue : T ) : TNotNull<T>;
      function ColorDanger ( aColor : String ) : TNotNull<T>;
      function DisplayComponent<x> ( aDisplay : x ) : TNotNull<T>;
      function &End : T;
  end;

implementation

uses
  Vcl.Graphics, Vcl.Dialogs;

{ TMaxLength<T> }

function TMaxLength<T>.ColorDanger(aColor: String): TNotNull<T>;
begin

end;

function TMaxLength<T>.Component(aValue: T): TNotNull<T>;
begin

end;

constructor TMaxLength<T>.Create(aParent: T);
begin
  FParent := aParent;
end;

function TMaxLength<T>.DisplayComponent<x>(aDisplay: x): TNotNull<T>;
begin

end;

function TMaxLength<T>.&End: T;
begin

end;

{ TMinLength<T> }

function TMinLength<T>.ColorDanger(aColor: String): TNotNull<T>;
begin

end;

function TMinLength<T>.Component(aValue: T): TNotNull<T>;
begin

end;

constructor TMinLength<T>.Create(aParent: T);
begin
  FParent := aParent;
end;

function TMinLength<T>.DisplayComponent<x>(aDisplay: x): TNotNull<T>;
begin

end;

function TMinLength<T>.&End: T;
begin

end;

{ TNotNull<T> }

function TNotNull<T>.ColorDanger : TNotNull<T>;
begin
   Result := Self;
   FComponent.Color := clRed;
end;

function TNotNull<T>.Component(aValue: TEdit): TNotNull<T>;
begin
  if aValue is TEdit then
  begin
    FComponent := aValue;
    Result := Self;
  end
  else
    raise Exception.Create('aValue is not a TEdit class (ValidationTypes.pas)');
end;

constructor TNotNull<T>.Create(aParent: T);
begin
  FParent := aParent;
end;

function TNotNull<T>.DisplayComponent( aDisplay: TLabel ): TNotNull<T>;
begin
  FDisplay := aDisplay;
end;

function TNotNull<T>.DisplayMsgError(aMsg: String): TNotNull<T>;
begin
    FComponent.OnChange := TNotifyEventWrapper.AnonProcToNotifyEvent(FComponent,
      procedure (Sender : TObject)
      begin
        if Length(Trim(FComponent.Text)) > 0 then
        begin
          FComponent.Color := clWhite;
          FDisplay.Visible := False;
        end;
      end
    );
    FComponent.OnExit := TNotifyEventWrapper.AnonProcToNotifyEvent(FComponent,
      procedure (Sender : TObject)
      begin
        if Trim(FComponent.Text) = '' then
        begin
          FComponent.Color := clRed;
          FComponent.SetFocus;
          FDisplay.Visible := True;
          FDisplay.Caption := 'Edit1 N�o pode ser vazio';
        end;
      end
    );
end;

function TNotNull<T>.&End: T;
begin
  Result := FParent;
end;

{ TNotifyEventWrapper }

class function TNotifyEventWrapper.AnonProcToNotifyEvent(Owner: TComponent;
  Proc: TProc<TObject>): TNotifyEvent;
begin
  Result := TNotifyEventWrapper.Create(Owner, Proc).Event;
end;

constructor TNotifyEventWrapper.Create(Owner: TComponent; Proc: TProc<TObject>);
begin
  inherited Create(Owner);
  FProc := Proc;
end;

procedure TNotifyEventWrapper.Event(Sender: TObject);
begin
  FProc(Sender);
end;

end.