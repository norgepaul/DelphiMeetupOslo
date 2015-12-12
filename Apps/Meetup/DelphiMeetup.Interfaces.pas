unit DelphiMeetup.Interfaces;

interface

type
  TLogCallback = reference to procedure(Sender: TObject; const LogMessage: String);

  ILogger = interface
    ['{D92F1092-2320-47AD-A9F9-C6DEBD8D9069}']
    procedure Log(const LogMessage: String);
    procedure RegisterLogCallback(const LogCallback: TLogCallback);
  end;

  // The IDelphiMeetupModel interface inherits from the ILogger interface.
  // Therefore, any IDelphiModelMeetup implementation must also implement
  // the methods declared in ILogger
  IDelphiMeetupModel = interface(ILogger)
    ['{2FFEC54E-5F0E-40CE-8353-31E013D9FE67}']
    function GetTime: TDateTime;
    procedure Log(const Value: String);
  end;

  // IBaseInterface provides a convenient way of accessing the Model interface
  IBaseInterface = interface
    ['{7BE9D3D1-2C9B-4055-B5FA-2D5DA73F9BDD}']
    function Model: IDelphiMeetupModel;
  end;

  IHassleRobin = interface(IBaseInterface)
    ['{D2A1BBA6-0DCE-41F0-9218-AA93B51CE8AB}']
    function GetRobinsMobile: String;
    procedure SetRobinsMobile(const Value: String);
    procedure HassleRobinNow;
    property RobinsMobile: String read GetRobinsMobile write SetRobinsMobile;
  end;

implementation

end.
