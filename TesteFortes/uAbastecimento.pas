unit uAbastecimento;

interface

uses uAbastecimento_Interface, System.Classes, System.TypInfo, System.SysUtils,
     Vcl.Dialogs;

const cPrecoGaso = 5.80;
const cPrecoDiesel = 4.60;
const cImposto = (13 / 100);

type
  TAbastecimento = class(TInterfacedObject, IAbastecimento)
  FDia:     TDateTime;
  FTanque:  TTanque;
  FBomba:   TBomba;
  FValor:   Double;
  FLitros:  Double;
  FImposto: Double;
  private
    constructor create;
    destructor Destroy; override;
    function GetImposto: Double;
    procedure SetImposto(const Value: Double);
    function GetValor: Double;
    procedure SetValor(const Value: Double);
  public
    property Dia: TDateTime read FDia write FDia;
    property Tanque: TTanque read FTanque write FTanque;
    property Bomba: TBomba read FBomba write FBomba;
    property Valor: Double read GetValor write SetValor;
    property Litros: Double read FLitros write FLitros;
    property Imposto: Double read GetImposto write SetImposto;
    procedure Abastecer(const pDia: TDateTime;
                        const pTanque:  TTanque;
                        const pBomba:   TBomba;
                        const pValor:   Double;
                        const pLitros:  Double); virtual;
    procedure ListaBomba(pLista: TStrings); virtual;
    function StrToBomba(const pBomba: string): TBomba; virtual;
    function BombaToStr(const pBomba: TBomba): string; virtual;
    function TanqueToStr(const pTanque: TTanque): string; virtual;
    function AssociaTanque(const pBomba :TBomba): TTanque; virtual;
    function RetornaLitros(const pValor: Double; const pTanque: TTanque): Double; virtual;
    procedure Inserir;

  end;

implementation

{ TAbastecimento }

uses uAbastecimentoController;

procedure TAbastecimento.Abastecer(const pDia: TDateTime;
  const pTanque: TTanque; const pBomba: TBomba; const pValor, pLitros: Double);
begin
  Dia := pDia;
  Tanque := pTanque;
  Bomba := pBomba;
  Valor := pValor;
  Litros := pLitros;
  Imposto := Valor * cImposto;

  Inserir;
end;

procedure TAbastecimento.SetImposto(const Value: Double);
begin
  FImposto := Value;
end;

procedure TAbastecimento.SetValor(const Value: Double);
begin
  if Value = 0 then
    raise Exception.Create('Valor não informado');
  FValor := Value;
end;

function TAbastecimento.StrToBomba(const pBomba: string): TBomba;
begin
  Result := TBomba(GetEnumValue(TypeInfo(TBomba), pBomba)) ;
end;

function TAbastecimento.TanqueToStr(const pTanque: TTanque): string;
begin
  Result := GetEnumName(TypeInfo(TTanque), Integer(pTanque)) ;
end;

function TAbastecimento.AssociaTanque(const pBomba: TBomba): TTanque;
begin
  case pBomba of
    B1_Gasolina : Result := tGasolina;
    B2_Gasolina : Result := tGasolina;
    B3_Diesel : Result := tDiesel;
    B4_Diesel : Result := tDiesel;
  end;
end;

function TAbastecimento.BombaToStr(const pBomba: TBomba): string;
begin
  Result := GetEnumName(TypeInfo(TBomba), Integer(pBomba)) ;
end;

constructor TAbastecimento.create;
begin

end;

destructor TAbastecimento.Destroy;
begin

  inherited;
end;

function TAbastecimento.GetImposto: Double;
begin
  Result := FImposto;
end;

function TAbastecimento.GetValor: Double;
begin
  Result := FValor;
end;

procedure TAbastecimento.Inserir;
var
  oAbastecimentoController: TAbastecimentoController;
  oAbastecimento: TAbastecimento;
  sAviso : string;
begin
    if not oAbastecimentoController.Inserir(oAbastecimento,sAviso) then
      raise Exception.Create(sAviso)
    else
      showmessage('Abastecimento realizado com sucesso!');
end;

procedure TAbastecimento.ListaBomba(pLista: TStrings);
var i: Integer;
begin
  for i := Ord(Low(TBomba)) to Ord(High(TBomba)) do
  begin
    pLista.Add(GetEnumName(TypeInfo(TBomba), i));
  end;
end;

function TAbastecimento.RetornaLitros(const pValor: Double;
  const pTanque: TTanque): Double;
var
  vLitros : double;
begin
  if pTanque = tGasolina then
    vLitros := pValor / cPrecoGaso
  else
    vLitros := pValor / cPrecoDiesel;

  Result := vLitros;
end;

end.


