unit DelphiMeetup.Factory;

interface

uses
  FMX.Forms,

  DelphiMeetup.Interfaces;

type
  TDelphiMeetupFactory = class
  class var
    FDelphiMeetupModel: IDelphiMeetupModel;
  public
    class function GetDelphiMeetupModel: IDelphiMeetupModel;
    class function NewHassleRobin: IHassleRobin;
  end;

implementation

uses
  DelphiMeetup.Model,
  DelphiMeetup.Classes;

{ TDelphiMeetupFactory }

class function TDelphiMeetupFactory.GetDelphiMeetupModel: IDelphiMeetupModel;
begin
  // We only ever create one implementation of the IDelphiMeetupModel
  // interface. We need to check if it already exists. If it doesn't we
  // create it here
  if FDelphiMeetupModel = nil then
  begin
    FDelphiMeetupModel := TDelphiMeetupModel.Create(Application);
  end;

  // Return the class variable
  Result := FDelphiMeetupModel;
end;

class function TDelphiMeetupFactory.NewHassleRobin: IHassleRobin;
begin
  Result := THassleRobin.Create;
end;

end.
