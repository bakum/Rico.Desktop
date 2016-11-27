unit setData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util,
  FireDAC.Comp.Script;

type
  TdmSettings = class(TDataModule)
    Rico_settingsConnection: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    ConnectionsTable: TFDQuery;
    ConnectionsTableid: TFDAutoIncField;
    ConnectionsTableu_name: TStringField;
    ConnectionsTablepass_wd: TStringField;
    fdUpdate: TFDUpdateSQL;
    fdCreate: TFDScript;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSettings: TdmSettings;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
