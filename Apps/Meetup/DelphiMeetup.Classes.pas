unit DelphiMeetup.Classes;

interface

uses
  Classes, SysUtils,

  DelphiMeetup.Interfaces;

type
  TBaseObject = class(TInterfacedObject,
                      IBaseInterface)
  protected
    // Returns an IDelphiMeetupModel obtained from the factory
    function Model: IDelphiMeetupModel;
  end;

  THassleRobin = class(TBaseObject,
                       IHassleRobin)
  strict private
    FRobinsMobile: String;
  private
    function GetRobinsMobile: String;
    procedure SetRobinsMobile(const Value: String);

    procedure HassleRobinNow;
  public
    constructor Create;
    destructor Destroy; override;

    // Properties in interfaces must use methods for their getter and setter.
    property RobinsMobile: String read GetRobinsMobile write SetRobinsMobile;
  end;

implementation

uses
  DelphiMeetup.Factory;

{ THassleRobin }

constructor THassleRobin.Create;
begin

end;

destructor THassleRobin.Destroy;
begin

  inherited;
end;

function THassleRobin.GetRobinsMobile: String;
begin
  Result := FRobinsMobile;
end;

procedure THassleRobin.HassleRobinNow;
begin
  // Log a message. This will be sent to all the log listeners
  Model.Log(format('Robin hassled on %s', [FRobinsMobile]));
end;

procedure THassleRobin.SetRobinsMobile(const Value: String);
begin
  FRobinsMobile := Value;
end;

{ TBaseObject }

function TBaseObject.Model: IDelphiMeetupModel;
begin
  // Return the singleton interface from the factory
  Result := TDelphiMeetupFactory.GetDelphiMeetupModel;
end;

end.
