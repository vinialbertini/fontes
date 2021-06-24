unit uCarrosController;

interface

uses uCarrosModel, Data.DB;

type
  TCarrosController = class
  public
    function InserirDadosBD(oCarros: TCarros; var Aviso: string): boolean;
    procedure ExecutarSql(oCarros: TCarros; iCodigo: integer);

  end;

implementation

{ TCarrosController }

uses uDM;

procedure TCarrosController.ExecutarSql(oCarros: TCarros; iCodigo: integer);
begin
  dmConexao.ExecutarSql_Carros(oCarros, iCodigo);
end;


function TCarrosController.InserirDadosBD(oCarros: TCarros;
  var Aviso: string): boolean;
begin
  Result := dmConexao.InserirDadosBD_Carros(oCarros, Aviso);
end;

end.
