unit main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.Layouts, FMX.Grid, FireDAC.UI.Intf, FireDAC.FMXUI.Wait, FireDAC.Stan.Intf,
  FireDAC.Comp.UI, FMX.Menus, System.Actions, FMX.ActnList, FMX.StdActns;

type
  TmForm = class(TForm)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    mnuMain: TMainMenu;
    miFile: TMenuItem;
    miOptions: TMenuItem;
    miExit: TMenuItem;
    miSettings: TMenuItem;
    alMain: TActionList;
    FileExit1: TFileExit;
    
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

uses data, setData;

end.
