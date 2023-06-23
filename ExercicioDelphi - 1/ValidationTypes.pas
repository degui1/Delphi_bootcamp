unit ValidationTypes;

interface

uses
  System.SysUtils, Vcl.StdCtrls, System.Classes, System.UITypes, RTTI.Utils;

type

  TNotifyEventWrapper = class(TComponent)
    private
      FProc : TProc<TObject>;
    public
      constructor Create ( Owner : TComponent; Proc : TProc<TObject> );
    published
      procedure Event ( Sender : TObject );
  end;

  TNotNull<T : class> = class
    private
      FParent : T;
      FComponent : TEdit;
      FLabel : TLabel;
      FColor : Integer;
    public
      constructor Create ( aParent : T );
      function Component ( aValue : TEdit ) : TNotNull<T>;
      function ColorDanger ( aColor : Integer ) : TNotNull<T>;
      function DisplayComponent ( aDisplay : TLabel ): TNotNull<T>;
      function DisplayMsgError ( aMsg : String ; aEdit : TEdit; aLabel : TLabel ) : TNotNull<T>;
      function &End : T;
      function AnonProc2NotifyEvent(Owner : TComponent ; aProc: TProc<TObject> ): TNotifyEvent;
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

function TNotNull<T>.AnonProc2NotifyEvent(Owner : TComponent ; aProc: TProc<TObject>): TNotifyEvent;
begin
  Result := TNotifyEventWrapper.Create(Owner, aProc).Event;
end;

function TNotNull<T>.ColorDanger ( aColor : Integer ) : TNotNull<T>;
begin
   Result := Self;
   FColor := aColor;
end;

function TNotNull<T>.Component(aValue: TEdit): TNotNull<T>;
begin
  FComponent := aValue;
  Result := Self;
end;

constructor TNotNull<T>.Create(aParent: T);
begin
  FParent := aParent;
end;

function TNotNull<T>.DisplayComponent( aDisplay: TLabel ): TNotNull<T>;
begin
  Result := Self;
  FLabel := aDisplay;
end;

function TNotNull<T>.DisplayMsgError( aMsg: String; aEdit : TEdit; aLabel : TLabel ): TNotNull<T>;
begin

  Result := Self;

  FComponent.OnChange := AnonProc2NotifyEvent(FComponent,
    procedure (Sender : TObject)
    begin
      if Length(Trim(aEdit.Text)) > 0 then
      begin
        aEdit.Color := clWhite;
        aLabel.Visible := False;
      end;
    end
  );
  FComponent.OnExit := AnonProc2NotifyEvent(FComponent,
    procedure (Sender : TObject)
    begin
      if Trim(aEdit.Text) = '' then
      begin
        aEdit.Color := clRed;
        aEdit.SetFocus;
        aLabel.Visible := True;
        aLabel.Caption := aMsg;
      end;
    end
  );

end;

function TNotNull<T>.&End: T;
begin
  Result := FParent;
end;

{ TNotifyEventWrapper }

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
