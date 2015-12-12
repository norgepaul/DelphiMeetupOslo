unit DelphiMeetup.Model;

interface

uses
  System.SysUtils, System.Classes, Generics.Collections,

  DelphiMeetup.Interfaces;

type
  TDelphiMeetupModel = class(TDataModule,
                             IDelphiMeetupModel)
  private
    FLogCallbacks: TList<TLogCallback>;

    // IDelphiMeetupModel
    // Methods are declared as private so they can only be accessed
    // via the IDelphiMeetupModel interface
    function GetTime: TDateTime;

    // ILogger
    // This model also implements the ILogger interface
    procedure Log(const LogMessage: String);
    procedure RegisterLogCallback(const LogCallback: TLogCallback);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  DelphiMeetupModel: TDelphiMeetupModel;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDelphiMeetupModel }

constructor TDelphiMeetupModel.Create(AOwner: TComponent);
begin
  inherited;

  // Create a generics list to hold the registered log listeners
  // Each time a log message is added it will be sent to all the listeners.
  // They can then display the log message if required. This is how you can
  // seperate the business logic from the view
  FLogCallbacks := TList<TLogCallback>.Create;
end;

destructor TDelphiMeetupModel.Destroy;
begin
  // Make sure you free your list
  FreeAndNil(FLogCallbacks);

  inherited;
end;

function TDelphiMeetupModel.GetTime: TDateTime;
begin
  // Set the result to the current date/time
  Result := now;

  // Log that the time was requested
  Log('Time requested');
end;

procedure TDelphiMeetupModel.Log(const LogMessage: String);
var
  i: Integer;
begin
  // Iterate all the log listeners and send them the log message
  for i := 0 to pred(FLogCallbacks.Count) do
  begin
    FLogCallbacks[i](Self, LogMessage);
  end;
end;

procedure TDelphiMeetupModel.RegisterLogCallback(
  const LogCallback: TLogCallback);
begin
  // Add a listener to the list
  FLogCallbacks.Add(LogCallback);
end;

end.
