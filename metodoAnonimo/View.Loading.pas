unit View.Loading;

interface

uses
  System.SysUtils;

type
  TLoadingProgress = procedure (aValue : Integer) of object;
  TLoadingMemo = procedure (aValue : Integer) of Object;
  TLoadingMemoFunc = procedure (aValue : array of String) of Object;
  TLoading = class
  private
    FOnLoadingProgressBar: TLoadingProgress;
    FOnLoadingMemo: TLoadingMemo;
    FOnLoadingMemoFunc: TLoadingMemoFunc;
    procedure SetOnLoadingProgressBar(const Value: TLoadingProgress);
    procedure SetOnLoadingMemo(const Value: TLoadingMemo);
    procedure SetOnLoadingMemoFunc(const Value: TLoadingMemoFunc);

  public
    procedure Preencher;

    procedure Exec;

    property OnLoadingProgressBar: TLoadingProgress read FOnLoadingProgressBar write SetOnLoadingProgressBar;

    property OnLoadingMemo : TLoadingMemo read FOnLoadingMemo write SetOnLoadingMemo;

    property OnLoadingMemoFunc: TLoadingMemoFunc read FOnLoadingMemoFunc write SetOnLoadingMemoFunc;

    procedure fazIsso(aValue: TProc<Integer>);
  end;

implementation

uses
  Winapi.Windows;

{ TLoading }

procedure TLoading.Exec;
var
  arr: array[0..20] of String;
  I: Integer;
begin
  for I := 0 to 20 do
  begin
    arr[I] := 'Guilherme';
    Sleep(20);
  end;
  FOnLoadingMemoFunc(arr);
end;

procedure TLoading.fazIsso(aValue: TProc<Integer>);
begin
  aValue(10);
end;

procedure TLoading.Preencher;
var
  I : Integer;
begin
  for I := 0 to 100 do
  begin
    Sleep(10);
    if Assigned(FOnLoadingProgressBar) then
      FOnLoadingProgressBar(I);
    if Assigned(FOnLoadingMemo) then
      FOnLoadingMemo(I);
  end;

end;

procedure TLoading.SetOnLoadingMemo(const Value: TLoadingMemo);
begin
  FOnLoadingMemo := Value;
end;

procedure TLoading.SetOnLoadingMemoFunc(const Value: TLoadingMemoFunc);
begin
  FOnLoadingMemoFunc := Value;
end;

procedure TLoading.SetOnLoadingProgressBar(const Value: TLoadingProgress);
begin
  FOnLoadingProgressBar := Value;
end;

end.
