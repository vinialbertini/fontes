unit UDM;

interface

uses
  System.SysUtils, System.Classes, uAbastecimento, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.DApt, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, Vcl.Forms, Winapi.Windows;

type
  TdmConexao = class(TDataModule)
    FDConexao: TFDConnection;
    fdqRel: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function InserirAbastecimento(oAbastecimento: TAbastecimento; out Aviso: string): Boolean;
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TdmConexao.DataModuleCreate(Sender: TObject);
var caminho: string;
  fs: TFileStream;
  rs: TResourceStream;
  s : string;
begin
  if not FileExists(ExtractFilePath(Application.ExeName)+'DADOS.FDB') then
  begin
    rs := TResourceStream.Create(hInstance, 'banco', RT_RCDATA);
    s  := ExtractFilePath(Application.ExeName)+'DADOS.FDB';
    fs := TFileStream.Create(s,fmCreate);
    rs.SaveToStream(fs);
    fs.Free;
  end;

  caminho := ExtractFilePath(Application.ExeName);
  Self.FDConexao.Params.Database := caminho + 'DADOS.FDB';
  Self.FDConexao.Open();
end;

function TdmConexao.InserirAbastecimento(oAbastecimento: TAbastecimento;
  out Aviso: string): Boolean;
var
  sqlAbastecimento: TFDQuery;
begin
  sqlAbastecimento := TFDQuery.Create(nil);
  try
    with sqlAbastecimento, oAbastecimento do
    begin
      Connection := FDConexao;
      SQL.Add( 'INSERT INTO ABASTECIMENTO' );
      SQL.Add(               '(DATA,' );
      SQL.Add(               'TANQUE,' );
      SQL.Add(               'BOMBA,' );
      SQL.Add(               'VALOR,');
      SQL.Add(               'LITROS,' );
      SQL.Add(               'IMPOSTO)' );
      SQL.Add(               'VALUES');
      SQL.Add(               '(:DATA,' );
      SQL.Add(               ':TANQUE,' );
      SQL.Add(               ':BOMBA,' );
      SQL.Add(               ':VALOR,');
      SQL.Add(               ':LITROS,' );
      SQL.Add(               ':IMPOSTO)' );

      ParamByName('DATA').AsDateTime := Dia;
      ParamByName('TANQUE').AsString := TanqueToStr(Tanque);
      ParamByName('BOMBA').AsString := BombaToStr(Bomba);
      ParamByName('VALOR').AsFloat := Valor;
      ParamByName('LITROS').AsFloat := Litros;
      ParamByName('IMPOSTO').AsFloat := Imposto;

      try
        ExecSQL();
        Result := true;
      except on E: Exception do
        begin
          Aviso := 'Erro ao inserir abastecimento: ' + sLineBreak + E.Message;
          Result := false;
        end;
      end;
    end;
  finally
    FreeAndNil(sqlAbastecimento);
  end;

end;

end.
