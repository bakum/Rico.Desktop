unit main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs;

type
  TmForm = class(TForm)
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mForm: TmForm;

implementation

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.Macintosh.fmx MACOS}

uses data;

end.
