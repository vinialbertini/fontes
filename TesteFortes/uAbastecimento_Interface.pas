unit uAbastecimento_Interface;

interface

uses System.Classes;

type
  TBomba = (B1_Gasolina, B2_Gasolina, B3_Diesel, B4_Diesel);
  TTanque = (tGasolina, tDiesel);
type
  IAbastecimento = interface
    ['{902A92D7-D5A8-445A-81C6-910561E830D9}']
  procedure Abastecer(const pDia: TDateTime;
                      const pTanque:  TTanque;
                      const pBomba:   TBomba;
                      const pValor:   Double;
                      const pLitros:  Double);
  procedure ListaBomba(pLista: TStrings);
  function StrToBomba(const pBomba: string): TBomba;
  function BombaToStr(const pBomba: TBomba): string;
  function TanqueToStr(const pTanque: TTanque): string;
  function AssociaTanque(const pBomba :TBomba): TTanque;
  function RetornaLitros(const pValor: Double; const pTanque: TTanque): Double;
  end;

implementation

end.
