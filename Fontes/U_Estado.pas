unit U_Estado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_Modelo, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TF_Estado = class(TF_Modelo)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit4: TEdit;
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    FDQuery1ID_ESTADO: TIntegerField;
    FDQuery1NOME_ESTADO: TStringField;
    FDQuery1SIGLA_ESTADO: TStringField;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    FDQuery2MAX: TIntegerField;
    procedure Spb_NovoClick(Sender: TObject);
    procedure Spb_SalvarClick(Sender: TObject);
    procedure Spb_CancelarClick(Sender: TObject);
    procedure Spb_EditarClick(Sender: TObject);
    procedure Spb_ExcluirClick(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    procedure LIMPACAMPOS;
    procedure HABILITACAMPOS;
    { Private declarations }
  public
    { Public declarations }
    crud: string;
  end;

var
  F_Estado: TF_Estado;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_Estado.Spb_CancelarClick(Sender: TObject);
begin
  inherited;
  LIMPACAMPOS;
end;

procedure TF_Estado.Spb_EditarClick(Sender: TObject);

begin
  inherited;
  HABILITACAMPOS;
  crud := 'ALTERAR';
  Edit2.SetFocus;

end;

procedure TF_Estado.Spb_ExcluirClick(Sender: TObject);
VAR
  SQL: STRING;
begin
  inherited;
  SQL := 'DELETE FROM ESTADO ' + //
    'WHERE ID_ESTADO =' + Edit1.TEXT;
  DM.FDConnection1.ExecSQL(SQL);
  DM.FDConnection1.CommitRetaining;
  LIMPACAMPOS;
end;

procedure TF_Estado.LIMPACAMPOS;
begin
  Edit1.TEXT := EmptyStr;
  Edit2.TEXT := EmptyStr;
  Edit3.TEXT := EmptyStr;
  crud := EmptyStr;
  Edit1.Enabled := FALSE;
  Edit2.Enabled := FALSE;
  Edit3.Enabled := FALSE;
end;

procedure TF_Estado.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  spb_editar.Enabled := true;
  Edit1.TEXT := FDQuery1ID_ESTADO.AsString;
  Edit2.TEXT := FDQuery1NOME_ESTADO.AsString;
  Edit3.TEXT := FDQuery1SIGLA_ESTADO.AsString;
  TabSheet1.Show;

end;

procedure TF_Estado.Edit2Change(Sender: TObject);
begin
  inherited;
  Edit2.CharCase := ecUpperCase;
end;

procedure TF_Estado.Edit4Change(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.ParamByName('NOME_ESTADO').AsString := Edit4.TEXT + '%';
  FDQuery1.Open();
  Edit4.CharCase := ecUpperCase;
end;

procedure TF_Estado.HABILITACAMPOS;
begin
  Edit1.Enabled := FALSE;
  Edit2.Enabled := true;
  Edit3.Enabled := true;
end;

procedure TF_Estado.Spb_NovoClick(Sender: TObject);

begin
  inherited;
  HABILITACAMPOS;
  TabSheet1.Show;
  Edit2.SetFocus;
  crud := 'Inserir';
end;

procedure TF_Estado.Spb_SalvarClick(Sender: TObject);
var
  SQL: string;
  MAX: INTEGER;
begin
  inherited;
  FDQuery2.Close;
  FDQuery2.Open();
  MAX := FDQuery2MAX.AsInteger + 1;

  if crud = 'Inserir' then
  begin
    Edit1.TEXT := FloatToStr(MAX);
    DM.FDQESTADO.Close;
    DM.FDQESTADO.Open();
    MAX := DM.FDQESTADOMAX.AsInteger + 1;

    SQL := 'Insert into estado values (' + //
      Edit1.TEXT + ',' + //
      QuotedStr(Edit2.TEXT) + ',' + //
      QuotedStr(Edit3.TEXT) + ')';
  end
  else
  begin
    SQL := 'UPDATE ESTADO SET' + //
      ' NOME_ESTADO =' + QuotedStr(Edit2.TEXT) + //
      ', SIGLA_ESTADO =' + QuotedStr(Edit3.TEXT) + //
      ' WHERE ID_ESTADO =' + Edit1.TEXT;
    DM.FDConnection1.ExecSQL(SQL);
    DM.FDConnection1.CommitRetaining;

  end;
  DM.FDConnection1.ExecSQL(SQL);
  DM.FDConnection1.CommitRetaining;
  LIMPACAMPOS;

end;

end.
