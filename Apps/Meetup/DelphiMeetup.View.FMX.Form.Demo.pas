unit DelphiMeetup.View.FMX.Form.Demo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls,

  DelphiMeetup.Factory,
  DelphiMeetup.Interfaces, FMX.Layouts;

type
  TfrmMVVMDemo = class(TForm)
    Memo1: TMemo;
    ActionList1: TActionList;
    actGetTime: TAction;
    actHassleRobin: TAction;
    Layout1: TLayout;
    Button2: TButton;
    Button1: TButton;
    Splitter1: TSplitter;
    procedure actGetTimeExecute(Sender: TObject);
    procedure actHassleRobinExecute(Sender: TObject);
  private
    procedure LogCallback(Sender: TObject; const LogMessage: String);
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  frmMVVMDemo: TfrmMVVMDemo;

implementation

{$R *.fmx}

procedure TfrmMVVMDemo.actGetTimeExecute(Sender: TObject);
begin
  ShowMessage(DateTimeToStr(TDelphiMeetupFactory.GetDelphiMeetupModel.GetTime));
end;

procedure TfrmMVVMDemo.actHassleRobinExecute(Sender: TObject);
var
  HassleRobin: IHassleRobin;
begin
  HassleRobin := TDelphiMeetupFactory.NewHassleRobin;

  HassleRobin.RobinsMobile := '5656456456';

  HassleRobin.HassleRobinNow;
end;

procedure TfrmMVVMDemo.LogCallback(Sender: TObject; const LogMessage: String);
begin
  Memo1.Lines.Add(LogMessage);
end;

constructor TfrmMVVMDemo.Create(AOwner: TComponent);
begin
  inherited;

  TDelphiMeetupFactory.GetDelphiMeetupModel.RegisterLogCallback(LogCallback);
end;

end.
