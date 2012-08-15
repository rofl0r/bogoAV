unit bogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    stu3: TFileStream;
    bmp: TBitmap;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormPaint(Sender: TObject);
begin
  form1.Canvas.Draw(0,0,bmp);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // load bmp
  stu3 := TFileStream.Create(ExtractFilePath(Application.ExeName) + 'splash.bmp', fmOpenRead);
  bmp := Tbitmap.Create;
  stu3.Seek(0,soFromBeginning);
  if stu3.size < 10 then exit;
  bmp.LoadFromStream(stu3);

  // scale to bitmap size
  self.Width := bmp.Width;
  self.Height := bmp.Height;

  // start timer to close ourselves after some seconds
  timer1.Interval := 6000;
  timer1.Enabled := true;

  // accept command line arguments for left and top offsets
  if(paramcount = 2) then begin
      left := strtoint(paramstr(1));
      top := strtoint(paramstr(2));
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  bmp.Free;
  stu3.Free;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  self.Close;
  timer1.Enabled := false;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
const
  SC_DRAGMOVE = $F012;

begin
  if (ssLeft in Shift) then
  begin
    ReleaseCapture;
    Form1.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;

  Paint;

end;

end.
