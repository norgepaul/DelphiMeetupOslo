program MVVM;

uses
  System.StartUpCopy,
  FMX.Forms,
  DelphiMeetup.Model in 'DelphiMeetup.Model.pas' {DelphiMeetupModel: TDataModule},
  DelphiMeetup.Interfaces in 'DelphiMeetup.Interfaces.pas',
  DelphiMeetup.Classes in 'DelphiMeetup.Classes.pas',
  DelphiMeetup.Types in 'DelphiMeetup.Types.pas',
  DelphiMeetup.Factory in 'DelphiMeetup.Factory.pas',
  DelphiMeetup.View.FMX.Form.Demo in 'DelphiMeetup.View.FMX.Form.Demo.pas' {frmMVVMDemo};

{$R *.res}

begin
  // Always report if there are any memory leaks
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TDelphiMeetupModel, DelphiMeetupModel);
  Application.CreateForm(TfrmMVVMDemo, frmMVVMDemo);
  Application.Run;
end.
