unit uAbastecimentoController;

interface

uses uAbastecimento;

type
  TAbastecimentoController = class
  public
    function Inserir(oAbastecimeto: TAbastecimento; var Aviso: string): boolean;
  end;

implementation


{ TAbastecimentoController }

uses UDM;

function TAbastecimentoController.Inserir(oAbastecimeto: TAbastecimento;
  var Aviso: string): boolean;
begin
  Result := dmConexao.InserirAbastecimento(oAbastecimeto, Aviso);
end;

end.
