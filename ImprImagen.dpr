{
     Impresi�n de im�genes
             v1.0

     Autor: Francisco J. S�ez S.

     Aplicaci�n para selecci�n e impresi�n de imagen. No se emplearon
     componentes de terceros.

     Calabozo, agosto de 2014
}

program ImprImagen;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FPrinc},
  TamCarta in 'TamCarta.pas' {FCarta},
  TamOficio in 'TamOficio.pas' {FAcerca},
  VistaPrevia in 'VistaPrevia.pas' {FVPrevia};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrinc, FPrinc);
  Application.Run;
end.
