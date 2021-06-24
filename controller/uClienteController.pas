unit uClienteController;

interface

uses uClienteModel, Data.DB;

type
  TClienteController = class
  public
    function InserirDadosBD(oCliente: TCliente; var Aviso: string): boolean;
    procedure ExecutarSql(oCliente: TCliente; iCodigo: integer);

  end;

implementation

{ TClienteController }

uses uDM;


procedure TClienteController.ExecutarSql(oCliente: TCliente; iCodigo: integer);
begin
  dmConexao.ExecutarSql_Cliente(oCliente, iCodigo);
end;

function TClienteController.InserirDadosBD(oCliente: TCliente;
  var Aviso: string): boolean;
begin
  Result := dmConexao.InserirDadosBD_Cliente(oCliente, Aviso);
end;

end.
