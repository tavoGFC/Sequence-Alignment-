program DNASequenceGenerator;
uses
  crt, Sysutils;


const
longitud_min = 7;
longitud_max = 1000000;


type
  vector = array [0..3] of String;

var
   sequences: vector;
   fileOut: TextFile;
   i:  Integer;
   randomSequence: Integer;
   longitud: Integer;
   nameFile: String;

begin
  sequences[0]:= 'A';//le asignamos a la posicion 0 el valor de A
  sequences[1]:= 'C';//le asignamos a la posicion 1 el valor de C
  sequences[2]:= 'G';//le asignamos a la posicion 2 el valor de G
  sequences[3]:= 'T';//le asignamos a la posicion 3 el valor de T

  Write('Especificar la longitud de la secuencia de ADN: ');
  ReadLn(longitud);
  if( longitud < longitud_min) then
      begin
        WriteLn('la longitud debe ser mayor o igual a 7');
        WriteLn('Presione ESC para salir');
        readkey;
        Exit;  //termina la aplicacion sin mostrar nada
      end;
  if( longitud > longitud_max) then
      begin
        WriteLn('la longitud debe ser menor o igual a 1 000 000');
        WriteLn('Presione ESC para salir');
        readkey;
        Exit; //termina la aplicacion
      end;
  Write('Escriba el nombre del archivo: ');
  ReadLn(nameFile);

  appendstr(nameFile, '.dna');

  WriteLn('Creando el archivo');
  //crea el archivo
  AssignFile(fileOut,nameFile);
  Rewrite(fileOut);

  for i:= 1 to longitud do
  begin
    randomSequence:= Random(4);
    randomSequence:= Random(4);
    Write(fileOut,sequences[randomSequence]);
  end;
  //cierra el archivo
  CloseFile(fileOut);
  WriteLn('Termino de crear el archivo');
  WriteLn('Presione ESC para salir');
  readkey;
end.

