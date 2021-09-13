unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.CategoryButtons,
  Vcl.WinXPickers;

type
  TfmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnBase: TPanel;
    Label1: TLabel;
    Label7: TLabel;
    cbBomba: TComboBox;
    Image1: TImage;
    Panel3: TPanel;
    lbValor: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbLitros: TLabel;
    btAbastecer: TButton;
    edValor: TButtonedEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    dtIni: TDatePicker;
    dtFim: TDatePicker;
    Label3: TLabel;
    rgAgrupamento: TRadioGroup;
    procedure btAbastecerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Abastecer;
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  function SoNumero(Key: Char; Texto: string; Decimal: Boolean = False): Char;
  public
    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;

implementation

{$R *.dfm}

uses uAbastecimento, uRelatorio;

{ TForm3 }


procedure TfmPrincipal.Abastecer;
var oAbastecimento: TAbastecimento;
    vValor,vLitros: double;
begin
  oAbastecimento := TAbastecimento.Create();
  if cbBomba.ItemIndex < 0 then
    raise Exception.Create('Selecione a bomba para abastecimento');
  if edValor.Text = EmptyStr then
    raise Exception.Create('Informe valor para o abastecimento');

  vValor := strtofloat(edValor.Text);
  vLitros := oAbastecimento.RetornaLitros((vValor),
             oAbastecimento.AssociaTanque(oAbastecimento.StrToBomba(cbBomba.Text)));
  try
    oAbastecimento.Abastecer(now,//Dia
              oAbastecimento.AssociaTanque(oAbastecimento.StrToBomba(cbBomba.Text)),  //Tanque
              oAbastecimento.StrToBomba(cbBomba.Text), //Bomba
              vValor, //Valor
              vLitros);//Litros

    lbLitros.Caption := formatfloat('#0.000', oAbastecimento.Litros);
    lbValor.Caption := formatfloat('R$ #0.00', oAbastecimento.Valor);
  finally
    FreeAndNil(oAbastecimento);
  end;
  panel3.visible := true;
  Label2.visible := true;
end;

procedure TfmPrincipal.btAbastecerClick(Sender: TObject);
begin
  Abastecer;
end;

procedure TfmPrincipal.Button1Click(Sender: TObject);
begin
  fmRelatorio := TfmRelatorio.Create(nil);
  fmRelatorio.ParametrosRel(rgAgrupamento.ItemIndex,dtIni.Date,dtFim.Date);
  fmRelatorio.rlFolha.Preview();
end;

procedure TfmPrincipal.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  Key := SoNumero(Key, edValor.Text, true);
end;

procedure TfmPrincipal.FormCreate(Sender: TObject);
var oAbastecimento: TAbastecimento;
begin
  oAbastecimento := TAbastecimento.Create();
  try
    oAbastecimento.ListaBomba(cbBomba.Items);
  finally
    FreeAndNil(oAbastecimento);
  end;
end;

function TfmPrincipal.SoNumero(Key: Char; Texto: string; Decimal: Boolean = False): Char;
begin
  if not Decimal then
  begin
    if not(Key in ['0'..'9', Chr(8)]) then
      Key := #0
  end
  else
  begin
    if Key = #46 then
       Key := FormatSettings.DecimalSeparator;
    if not(Key in ['0'..'9', Chr(8), FormatSettings.DecimalSeparator]) then
      Key := #0
    else
    if (Key = FormatSettings.DecimalSeparator) and
       (Pos( Key, Texto) > 0 ) then
         Key := #0;
  end;
  Result := Key;
end;

end.
