unit uVendaController;

interface

uses uVendaModel, Data.DB;

type
  TVendaController = class
  public
    function InserirDadosBD(oVenda: TVenda; var Aviso: string): boolean;
    procedure ExecutarSql(oVenda: TVenda; iCodigo: integer);

  end;

implementation

{ TVendaController }

uses uDM;


procedure TVendaController.ExecutarSql(oVenda: TVenda; iCodigo: integer);
begin
  dmConexao.ExecutarSql_Venda(oVenda, iCodigo);
end;

function TVendaController.InserirDadosBD(oVenda: TVenda;
  var Aviso: string): boolean;
begin
  Result := dmConexao.InserirDadosBD_Venda(oVenda, Aviso);
end;

end.
