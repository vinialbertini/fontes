unit uVendaModel;

interface

uses System.Generics.Collections, System.Generics.Defaults,
     System.SysUtils, uClienteModel, uCarrosModel;

type
  TVenda = class
     private
       FCodigo: integer;
       FoCliente: TCliente;
       FoCarros: TCarros;
       { private declarations }
     protected
       { protected declarations }
     public
       { public declarations }
       property Codigo: integer read FCodigo write FCodigo;
       property oCliente: TCliente read FoCliente write FoCliente;
       property oCarros: TCarros read FoCarros write FoCarros;

      constructor Create;
      destructor Destroy; override;

     published
       { published declarations }
     end;
implementation

{ TVenda }

constructor TVenda.Create;
begin

end;

destructor TVenda.Destroy;
begin

  inherited;
end;

end.
