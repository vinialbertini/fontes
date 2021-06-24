unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr,
  uClienteModel, uCarrosModel, UVendaModel, Data.Win.ADODB;

type
  TdmConexao = class(TDataModule)
    SQLConnection: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }

    //os métodos abaixo poderiam ser overload, porém achei por bem explicitar
    //para não precisar advinha o dataset e facilitar a manutenção por eventuais erros

    //Não fiz as rotinas de inserir 5 clientes, 5 carros e 5 vendas por conta do tempo excasso
    // mas poderia ser feito dessa forma para testes. Exemplo de carros...
    // por ex for i := 0 to 4 do
    //        begin
    //          oCarros.Modelo := 'Modelo_' + i.ToString;
    //        end;
    procedure ExecutarSql_Cliente(oCliente: TCliente; iCodigo: integer);
    function InserirDadosBD_Cliente(oCliente: TCliente; out Aviso: string): Boolean;

    procedure ExecutarSql_Carros(oCarros: TCarros; iCodigo: integer);
    function InserirDadosBD_Carros(oCarros: TCarros; out Aviso: string): Boolean;

    procedure ExecutarSql_Venda(oVenda: TVenda; iCodigo: integer);
    function InserirDadosBD_Venda(oVenda: TVenda; out Aviso: string): Boolean;

  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConexao }

procedure TdmConexao.ExecutarSql_Cliente(oCliente: TCliente; iCodigo: integer);
var
  sqlCliente: TADOQuery;
begin
  sqlCliente := TADOQuery.Create(nil);
  try
    with sqlCliente do
    begin
      Connection := SQLConnection;
      SQL.Add('SELECT * FROM CLIENTE WHERE CODIGO = '+ IntToStr(iCodigo));
      Open;
      with oCliente do
      begin
        Codigo := fieldbyname('CODIGO').AsInteger;
        CPF := fieldbyname('CPF').AsString;
      end;
    end;
  finally
    FreeAndNil(sqlCliente);
  end;
end;

procedure TdmConexao.ExecutarSql_Carros(oCarros: TCarros; iCodigo: integer);
var
  sqlCarros: TADOQuery;
begin
  sqlCarros := TADOQuery.Create(nil);
  try
    with sqlCarros do
    begin
      Connection := SQLConnection;
      SQL.Add('SELECT * FROM CARROS WHERE CODIGO = '+ IntToStr(iCodigo));
      Open;
      with oCarros do
      begin
        Codigo := fieldbyname('CODIGO').AsInteger;
        Modelo := fieldbyname('MODELO').AsString;
        DataLancamento := fieldbyname('DATALANCAMENTO').AsDateTime;
      end;
    end;
  finally
    FreeAndNil(sqlCarros);
  end;
end;


function TdmConexao.InserirDadosBD_Cliente(oCliente: TCliente; out Aviso: string): Boolean;
var
  sqlCliente: TADOQuery;
begin
  sqlCliente := TADOQuery.Create(nil);
  try
    with sqlCliente, oCliente do
    begin
      Connection := SQLConnection;
      SQL.Add( 'INSERT INTO CLIENTE' );
      SQL.Add(               '(CPF)');
      SQL.Add(               'VALUES');
      SQL.Add(               ' '''+CPF+''')');
      try
        ExecSQL();
        Result := true;
      except on E: Exception do
        begin
          Aviso := 'Erro ao inserir cliente: ' + sLineBreak + E.Message;
          Result := false;
        end;
      end;
    end;
  finally
    FreeAndNil(sqlCliente);
  end;
end;

function TdmConexao.InserirDadosBD_Carros(oCarros: TCarros;
  out Aviso: string): Boolean;
var
  sqlCarros: TADOQuery;
begin
  sqlCarros := TADOQuery.Create(nil);
  try
    with sqlCarros, oCarros do
    begin
      Connection := SQLConnection;
      SQL.Add( 'INSERT INTO CARROS' );
      SQL.Add(               '(MODELO,' );
      SQL.Add(               'DATALANCAMENTO)' );
      SQL.Add(               'VALUES');
      SQL.Add(               ' '''+Modelo+''',');
      SQL.Add(               '('''+DateToStr(DataLancamento)+''')');

      try
        ExecSQL();
        Result := true;
      except on E: Exception do
        begin
          Aviso := 'Erro ao inserir carro: ' + sLineBreak + E.Message;
          Result := false;
        end;
      end;
    end;
  finally
    FreeAndNil(sqlCarros);
  end;

end;

function TdmConexao.InserirDadosBD_Venda(oVenda: TVenda; out Aviso: string): Boolean;
var
  sqlVenda: TADOQuery;
begin
  sqlVenda := TADOQuery.Create(nil);
  try
    with sqlVenda, oVenda do
    begin
      Connection := SQLConnection;
      SQL.Add( 'INSERT INTO VENDAS' );
      SQL.Add(               '(CODIGOCLIENTE,' );
      SQL.Add(               'CODIGOCARRO)' );
      SQL.Add(               'VALUES');
      SQL.Add(               ' '''+oCliente.Codigo.ToString+''',');
      SQL.Add(               '('''+oCarroS.Codigo.ToString+''')');
      try
        ExecSQL();
        Result := true;
      except on E: Exception do
        begin
          Aviso := 'Erro ao inserir venda: ' + sLineBreak + E.Message;
          Result := false;
        end;
      end;
    end;
  finally
    FreeAndNil(sqlVenda);
  end;
end;

procedure TdmConexao.ExecutarSql_Venda(oVenda: TVenda; iCodigo: integer);
var
  sqlVenda: TADOQuery;
begin
  sqlVenda := TADOQuery.Create(nil);
  try
    with sqlVenda do
    begin
      Connection := SQLConnection;
      SQL.Add('SELECT * FROM VENDAS WHERE CODIGO = '+ IntToStr(iCodigo));
      Open;
      with oVenda do
      begin
        Codigo := fieldbyname('CODIGO').AsInteger;
        oCliente.Codigo := fieldbyname('CODIGOCLIENTE').AsInteger;
        oCarros.Codigo := fieldbyname('CODIGOCARRO').AsInteger;
      end;
    end;
  finally
    FreeAndNil(sqlVenda);
  end;
end;

end.
