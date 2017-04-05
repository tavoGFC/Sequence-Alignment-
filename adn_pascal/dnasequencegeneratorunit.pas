unit DNASequenceGeneratorUnit;

{$mode objfpc}{$H+}

interface

procedure generateSequence(name: String; lengthSequence: Integer);

//constantes para verificar la longitud de entrada
const
longitud_min = 7;
longitud_max = 1000000;
//se crea un arreglo
type
  vector = array [0..3] of String;

var
   sequences: vector; //arreglo para guardar los valores
   fileOut: TextFile; //archivo
   i:  Integer;       //contador
   randomSequence: Integer;     //generador random de 0 3
   longitud: Integer;           //longitud digita por el usuario
   nameFile: String;            //nombre del archivo

 //---------------------Fin de declaraciones---------------\\
implementation
uses
  Classes, SysUtils;




procedure  generateSequence(name: String; lengthSequence: Integer);
begin
  WriteLn('Creando el archivo con el nombre: ', name);
  WriteLn('Con una secuencia de largo: ', lengthSequence);
  //crea el archivo
  AssignFile(fileOut,name);
  Rewrite(fileOut);

  for i:= 1 to lengthSequence do
  begin
    randomSequence:= Random(4);
    randomSequence:= Random(4);
    //ingresa al archivo valores random  del arreglo sequences
    Write(fileOut,sequences[randomSequence]);
  end;
  //cierra el archivo
  CloseFile(fileOut);
  WriteLn('Termino de crear el archivo');
end;

end.

