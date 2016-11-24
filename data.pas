unit data;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.MSSQLDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Comp.Client, Data.DB, FireDAC.Phys.ODBCBase;

type
  TdmData = class(TDataModule)
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    Rico_olapConnection: TFDConnection;
    readTransaction: TFDTransaction;
    writeTransaction: TFDTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmData: TdmData;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
