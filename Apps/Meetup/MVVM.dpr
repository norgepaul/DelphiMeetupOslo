program MVVM;

uses
  System.StartUpCopy,
  FMX.Forms,
  DelphiMeetup.MVVM.Model in 'DelphiMeetup.MVVM.Model.pas' {DelphiMeetupModel: TDataModule},
  DelphiMeetup.MVVM.Interfaces in 'DelphiMeetup.MVVM.Interfaces.pas',
  DelphiMeetup.MVVM.Classes in 'DelphiMeetup.MVVM.Classes.pas',
  DelphiMeetup.MVVM.Types in 'DelphiMeetup.MVVM.Types.pas',
  DelphiMeetup.MVVM.Factory in 'DelphiMeetup.MVVM.Factory.pas',
  DelphiMeetup.MVVM.View.FMX.Form.Demo in 'DelphiMeetup.MVVM.View.FMX.Form.Demo.pas' {frmMVVMDemo};

{$R *.res}

begin
  // Always report if there are any memory leaks
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TDelphiMeetupModel, DelphiMeetupModel);
  Application.CreateForm(TfrmMVVMDemo, frmMVVMDemo);
  Application.Run;
end.
