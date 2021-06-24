unit uCarrosModel;

interface

uses System.SysUtils;

type
  TCarros = class
  private
    FCodigo: integer;
    FModelo: string;
    FDataLancamento: TDateTime;
    procedure SetModelo(const AValue: string);
    function GetModelo: string;


    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    property Codigo: integer read FCodigo write FCodigo;
    property Modelo: string read GetModelo write SetModelo;
    property DataLancamento: TDateTime read FDataLancamento write FDataLancamento;


  published
    { published declarations }
  end;

implementation

{ TCarros }

function TCarros.GetModelo: string;
begin
  Result := FModelo;
end;


procedure TCarros.SetModelo(const AValue: string);
begin
  if AValue = EmptyStr then
    raise Exception.Create('Modelo não informado!');
  FModelo := AValue;
end;

end.
