program DNASequenceGenerator;
uses
  crt, Sysutils, DNASequenceGeneratorUnit;


var
  keyP: Char;

begin
  sequences[0]:= 'A';//le asignamos a la posicion 0 el valor de A
  sequences[1]:= 'C';//le asignamos a la posicion 1 el valor de C
  sequences[2]:= 'G';//le asignamos a la posicion 2 el valor de G
  sequences[3]:= 'T';//le asignamos a la posicion 3 el valor de T

  repeat

  Write('Especificar la longitud de la secuencia de ADN: ');
  ReadLn(longitud);
  if( longitud < longitud_min) then
      begin
        WriteLn('la longitud debe ser mayor o igual a 7');
        WriteLn('Presione ESC para salir');
        ReadKey;
        Exit;
      end;
  if( longitud > longitud_max) then
      begin
        WriteLn('la longitud debe ser menor o igual a 1 000 000');
        WriteLn('Presione ESC para salir');
        readkey;
        Exit;
      end;
  Write('Escriba el nombre del archivo: ');
  ReadLn(nameFile);
  appendstr(nameFile, '.dna');

  generateSequence(nameFile, longitud);

  WriteLn('Presione ESC para salir');

  keyP:= ReadKey;
  until keyP=#27 {Esc}

end.

