unit uRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RLReport;

type
  TfmRelatorio = class(TForm)
    rlFolha: TRLReport;
    RLBand1: TRLBand;
    DataSource1: TDataSource;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    rlGrupo: TRLGroup;
    RLBand4: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand5: TRLBand;
    RLDBResult1: TRLDBResult;
    RLBand3: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLBand6: TRLBand;
    lbAgrupamento: TRLLabel;
    lbdbAgrup: TRLDBText;
    RLBand7: TRLBand;
    RLDBResult2: TRLDBResult;
    lbFiltroData: TRLLabel;
    procedure rlFolhaBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDBResult1Compute(Sender: TObject; var Value: Variant;
      var AText: string; var ComputeIt: Boolean);
    procedure RLDBResult2Compute(Sender: TObject; var Value: Variant;
      var AText: string; var ComputeIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ParametrosRel(pAgrupamento: integer; pDataini,pDatafim: TDateTime);
  end;

var
  fmRelatorio: TfmRelatorio;

implementation

{$R *.dfm}

uses UDM;

procedure TfmRelatorio.ParametrosRel(pAgrupamento: integer; pDataini,
  pDatafim: TDateTime);
begin
  lbFiltroData.Caption := 'Período de '+DateToStr(pDataini)+' até '+DateToStr(pDatafim);
  dmConexao.fdqRel.SQL.Clear;
  dmConexao.fdqRel.SQL.Add('select Data,');
  dmConexao.fdqRel.SQL.Add('Substring(Tanque FROM 2 FOR CHAR_LENGTH(Tanque)) as Tanque,');
  dmConexao.fdqRel.SQL.Add('Substring(Bomba FROM 2 FOR 1)||''-''||Substring(Bomba FROM 4 FOR CHAR_LENGTH(Bomba)) as Bomba,');
  dmConexao.fdqRel.SQL.Add('Valor');
  dmConexao.fdqRel.SQL.Add('from abastecimento');

  dmConexao.fdqRel.SQL.Add('WHERE DATA BETWEEN :pDATAINI AND :pDATAFIM');
  dmConexao.fdqRel.ParamByName('pDATAINI').AsDateTime := pDataini;
  dmConexao.fdqRel.ParamByName('pDATAFIM').AsDateTime := pDatafim;

  if pAgrupamento = 0 then
  begin
    dmConexao.fdqRel.SQL.Add('ORDER BY TANQUE');
    rlGrupo.DataFields := 'TANQUE';
    lbdbAgrup.DataField := 'TANQUE';
    lbAgrupamento.Caption := 'Agrupado por Tanque';
  end
  else
  begin
    dmConexao.fdqRel.SQL.Add('ORDER BY BOMBA');
    rlGrupo.DataFields := 'BOMBA';
    lbdbAgrup.DataField := 'BOMBA';
    lbAgrupamento.Caption := 'Agrupado por Bomba'
  end;
end;

procedure TfmRelatorio.RLDBResult1Compute(Sender: TObject; var Value: Variant;
  var AText: string; var ComputeIt: Boolean);
begin
  Value := dmConexao.fdqRel.FieldByName('Valor').AsCurrency;
end;

procedure TfmRelatorio.RLDBResult2Compute(Sender: TObject; var Value: Variant;
  var AText: string; var ComputeIt: Boolean);
begin
  Value := dmConexao.fdqRel.FieldByName('Valor').AsCurrency;
end;

procedure TfmRelatorio.rlFolhaBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  dmConexao.fdqRel.Open;
end;

end.
