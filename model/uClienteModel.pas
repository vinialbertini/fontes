unit uClienteModel;

interface

uses System.SysUtils;

type
  TCliente = class
  private
    FCodigo: integer;
    FCPF: string;
    procedure SetCPF(const AValue: string);
    function GetCPF: string;




    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    property Codigo: integer read FCodigo write FCodigo;
    property CPF: string read GetCPF write SetCPF;

  published
    { published declarations }
  end;

implementation

{ TCliente }

function TCliente.GetCPF: string;
begin
  Result := FCPF;
end;

procedure TCliente.SetCPF(const AValue: string);
begin
  if AValue = EmptyStr then
    raise Exception.Create('CPF não informado!');
  FCPF := AValue;
end;

end.
