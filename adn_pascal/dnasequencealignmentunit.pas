unit DNASequenceAlignmentunit;

{$mode objfpc}{$H+}

interface
const
  gap: Integer = -5;
  //matriz similar para realizar el alineamineto
  //    A   G   C   T
  //A  10  -1  -3  -4
  //G  -1   7  -5  -3
  //C  -3  -5   9   0
  //T  -4  -3   0   8
  similarityMatrix: array[0..3,0..3]of Integer =
    ((10,-1,-3,-4),(-1,7,-5,-3),(-3,-5,9,0),(-4,-3,0,8));

  //valores de los nucleotidos en la matriz similar
  A: Integer = 0;
  G: Integer = 1;
  C: Integer = 2;
  T: Integer = 3;


var
  namefile1: String;
  namefile2: String;
  sequence1: String;
  sequence2: String;
  match: Integer;
  left: Integer;
  up: Integer;
  valueMax: Integer;
  rowsM: Integer;
  columnsM: Integer;
  nucleotideI: Char;
  nucleotideJ: Char;

  result1: String;
  result2: String;
  iMM,jMM: Integer;

  //debe haber una manera mas eficiente, pero me da error al poner
  //los valores rows y columns en el arreglo
  matrix: array[0..1500, 0..2000] of Integer;

//-------------------------------- Fin de Var y Const Globales----------------\\

//-------------------------------- Funciones y Procesos ----------------------\\
procedure getSequece(nameFile: String; var bufferS: String);
procedure generateMatrix(rows, columns: Integer);
procedure getAlignment(rows, columns: Integer);


implementation
uses
  Classes, SysUtils, math, strutils;


//guarda el resultado en la variable bufferS
procedure getSequece(nameFile: String; var bufferS: String);
var
  fileRead: TextFile;
begin
  AssignFile(fileRead, nameFile);
  Reset(fileRead);
  while not eof(fileRead) do
  begin
    ReadLn(fileRead,bufferS);
  end;
  CloseFile(fileRead);
end;

//generar la matriz con las secuencias
procedure generateMatrix(rows, columns: Integer);
var
  i,j,iSM,jSM: Integer;
begin
  //Inicializa el gap en la matriz
  for i:= 0 to rows do
      matrix[i][0]:= gap * i;
  for j:= 0 to columns do
      matrix[0][j]:= gap * j;


  for i:= 0 to (rows-1) do
      begin
      for j:= 0 to (columns-1) do
          begin
            nucleotideI:= sequence2[i+1];
            case (nucleotideI) of
            'A' : iSM:= A;
            'G' : iSM:= G;
            'C' : iSM:= C;
            'T' : iSM:= T;
            end;
            nucleotideJ:= sequence1[j+1];
            case (nucleotideJ) of
            'A' : jSM:= A;
            'G' : jSM:= G;
            'C' : jSM:= C;
            'T' : jSM:= T;
            end;
            //Write('comprobando ',nucleotideI, ' y ', nucleotideJ);
            match:= matrix[i][j] + similarityMatrix[iSM][jSM];
            up:= matrix[i][j+1] + gap;
            valueMax:= Max(match, up);
            left:= matrix[i+1][j] + gap;
            valueMax:= Max(valueMax, left);
            //Write(' ', valueMax, ' , ');
            matrix[i+1][j+1]:= valueMax;
          end;
      end;
end;

procedure getAlignment(rows, columns: Integer);
var
  i,j,iSM,jSM: Integer;
begin
  WriteLn('creando la alineacion de secuencias');
  i:= (rows); //sequecen2
  j:= (columns); //sequence1
  while ( (i > 0) and (j > 0) ) do
  begin
        nucleotideI:= sequence2[i];
          case (nucleotideI) of
          'A' : iSM:= A;
          'G' : iSM:= G;
          'C' : iSM:= C;
          'T' : iSM:= T;
          end;
          nucleotideJ:= sequence1[j];
          case (nucleotideJ) of
          'A' : jSM:= A;
          'G' : jSM:= G;
          'C' : jSM:= C;
          'T' : jSM:= T;
          end;
        match:= matrix[i-1][j-1] + similarityMatrix[iSM][jSM];
        up:= matrix[i-1][j] + gap;
        left:= matrix[i][j-1] + gap;

        if(left = matrix[i][j]) then
           begin
             AppendStr(result1, '-');
             AppendStr(result2, nucleotideJ);
             j:= j-1;
           end
       else if(up = matrix[i][j]) then
           begin
             AppendStr(result1, nucleotideI);
             AppendStr(result2, '-');
             i:= i-1;
           end
       else
           begin
             AppendStr(result2, nucleotideI);
             AppendStr(result1, nucleotideJ);
             i:= i-1;
             j:= j-1;
           end;
  end;
  while (i > 0) do
  begin
       nucleotideI:= sequence2[i-1];
       AppendStr(result2, nucleotideI);
       AppendStr(result1, '-');
       i:= i-1;
  end;

  while (j > 0) do
  begin
       nucleotideJ:= sequence1[j-1];
       AppendStr(result2, '-');
       AppendStr(result1, nucleotideJ);
       j:= j-1;
  end;
  WriteLn('La alineacion Global se ha realizado: ');
  WriteLn(ReverseString(result2));
  WriteLn(ReverseString(result1));
end;

end.

