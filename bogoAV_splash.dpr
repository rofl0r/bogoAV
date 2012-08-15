program bogoAV_splash;

uses
  Forms,
  bogo in 'bogo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Bogo ANTIVIRUS Splash';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
