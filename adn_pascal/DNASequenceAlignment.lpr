program DNASequenceAlignment;
uses
  crt, Sysutils, math, DNASequenceAlignmentunit;


begin
  WriteLn('Ingrese el nombre del primer archivo .dna');
  ReadLn(namefile1);
  WriteLn('Ingrese el nombre del segundo archivo .dna');
  ReadLn(namefile2);

  //le asigna la extension '.dna' a los nombres
  appendstr(namefile1, '.dna');
  appendstr(namefile2, '.dna');

  //obtiene las secuencias de los archivos
  //los guarda en sequence(1,2)
  getSequece(namefile1,sequence1);
  getSequece(namefile2,sequence2);

  //asigna el largo de las secuencias
  rowsM := Length(sequence2);
  columnsM := Length(sequence1);


  WriteLn(sequence2, '--cantidad de filas: ', rowsM);
  WriteLn(sequence1, '--cantidad de columnas: ', columnsM);
  generateMatrix(rowsM,columnsM);
  for iMM:= 0 to (rowsM) do
  begin
      for jMM:= 0 to (columnsM) do
          begin
          Write(matrix[iMM][jMM], ' ');
          end;
      WriteLn('');
  end;

  getAlignment(rowsM, columnsM);

  ReadKey;

end.

