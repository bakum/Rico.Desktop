unit data;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.ODBCBase, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util,
  FireDAC.Comp.Script;

type
  TdmData = class(TDataModule)
    Rico_olapConnection: TFDConnection;
    VwreferenceView: TFDQuery;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    VwaccumregView: TFDQuery;
    VwchrcView: TFDQuery;
    VwconstsView: TFDQuery;
    VwinforegView: TFDQuery;
    scrCreate: TFDScript;
    qryCustom: TFDQuery;
    VwreferenceViewV8_DataType: TBCDField;
    VwreferenceViewV8_ObjectName: TWideMemoField;
    VwreferenceViewV8_ObjectID: TBCDField;
    VwreferenceViewTableName: TWideStringField;
    VwreferenceViewV8_ObjectOwnerID: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmData: TdmData;

implementation

{$R *.dfm}

end.
