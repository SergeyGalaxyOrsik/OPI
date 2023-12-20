program Project4;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

type
  Tstring = array of string;
  TRef = array [1 .. 8] of string;
  TBool  =  array of boolean;

  // else A[i] := RandomWordInFile(Language,Length(a[i]));
var
  probely:  TBool;
  Ref:Tref;
  // Ref: TRef; // Ref - ������ ������ �� ��������� �����
  CurrStr, InputStr: string;
  InputStr_inMas, OutputStr_inMas, MasWords_CurrStr, MasWords_TempStr,
    InputStr_TempStr: Tstring;
  currWord, TempStr: string;
  n: integer;
  Language: integer = 1;
  CountOfLetters: integer;
  Level: integer;
  gggg: integer;
  f : boolean;

function RandomWordInFile(var Language: integer;
  const CountOfLetters: integer): string;
var
  str: string;
  currFile: TextFile;
  n: byte;
  mas_size_words: array of integer;
  number_letters_word: integer;
  letters_left: integer;
  i: integer;
begin
  result := '';
 // writeln('r = ', result);
 /// writeln('---------');
  SetLength(mas_size_words, CountOfLetters div 4 + 1);

  letters_left := CountOfLetters;
  i := 0;
  randomize;
  while i <= length(mas_size_words) - 1 do
  begin

    repeat
      number_letters_word := random(7) + 1;
    until number_letters_word <= letters_left;

    if (i = length(mas_size_words) - 1) then
    begin
      mas_size_words[i] := letters_left;
      i := length(mas_size_words);
    end
    else
    begin
      letters_left := letters_left - number_letters_word;
      mas_size_words[i] := number_letters_word;
      inc(i);
      number_letters_word := 8 - number_letters_word;
      letters_left := letters_left - number_letters_word;
      mas_size_words[i] := number_letters_word;
      inc(i);
    end;
  end;

  for i := 0 to length(mas_size_words) - 1 do
  begin
    // CountOfLetters:= mas_size_words[i];
    AssignFile(currFile, Ref[mas_size_words[i]]);
    Reset(currFile);
    randomize;
    n := random(6);
    for var j := 0 to n - 1 do
    begin
      readln(currFile);
    end;
    readln(currFile, str);
    Close(currFile);

    if i <> 0 then
    begin
      result := result + ' ' + str;
    end
    else
      result := result + str;
  end;
 // writeln(result);
end;

procedure proverka(var A, B: array of string; var Level: integer;
  var s: string; var probely : TBool; language : integer);
var
  i, j, k: integer;
  f: boolean;
  temp,posledniye : string;
  mass: array of integer;
begin
  s := '';
  f := true;
  if Level <= 2 then
  begin
    if length(A) = length(B) then
    begin
      for i := 0 to length(A) - 1 do
      begin
        // setlength(mass, length(A[i]));

        if length(A[i]) = length(B[i]) then
        begin
          temp := '';
          for j := 1 to length(B[i]) do
          begin
            if A[i][j] <> B[i][j] then
            begin
              f := false;
              for k := 1 to Level do
                temp := temp + A[i][j] + A[i][j];
            end
            else
              temp := temp + A[i][j];
          end;
        end;

        if length(A[i]) > length(B[i]) then
        begin
          temp := '';
          f := false;
          for j := 1 to length(B[i]) do
          begin
            if A[i][j] <> B[i][j] then
            begin
              for k := 1 to Level do
                temp := temp + A[i][j] + A[i][j];
            end
            else
              temp := temp + A[i][j];
          end;
          for j := length(B[i]) + 1 to length(A[i]) do
            for k := 1 to Level do
              temp := temp + A[i][j] + A[i][j];
        end;

        if length(A[i]) < length(B[i]) then
        begin
          temp := '';
          f := false;
          for j := 1 to length(A[i]) do
          begin
            if A[i][j] <> B[i][j] then
            begin
              for k := 1 to Level do
                temp := temp + A[i][j] + A[i][j];
            end
            else
              temp := temp + A[i][j];
          end;
          for j := length(A[i]) + 1 to length(B[i]) do
            temp := temp + ' ' + A[i][length(A[i])];
        end;
       if temp = A[i] then
        begin
          temp := RandomWordInFile(Language, length(A[i]));
          writeln('a[i] = ', temp);
        end; // else ��������� ������
        s := s + ' ' + temp;
        if probely[i] = true then s := s + ' ' + A[i][Length(A[i])];
      end;



    end;

    if length(A) > length(B) then
    begin
      f := false;
      for i := 0 to length(B) - 1 do
      begin
        // setlength(mass, length(A[i]));

        if length(A[i]) = length(B[i]) then
        begin
          temp := '';
          for j := 1 to length(B[i]) do
          begin
            if A[i][j] <> B[i][j] then
            begin
              for k := 1 to Level do
                temp := temp + A[i][j] + A[i][j];
            end
            else
              temp := temp + A[i][j];
          end;
        end;

        if length(A[i]) > length(B[i]) then
        begin
          temp := '';
          for j := 1 to length(B[i]) do
          begin
            if A[i][j] <> B[i][j] then
            begin
              for k := 1 to Level do
                temp := temp + A[i][j] + A[i][j];
            end
            else
              temp := temp + A[i][j];
          end;
          for j := length(B[i]) + 1 to length(A[i]) do
            for k := 1 to Level do
              temp := temp + A[i][j] + A[i][j];
        end;

        if length(A[i]) < length(B[i]) then
        begin
          temp := '';
          f := false;
          for j := 1 to length(A[i]) do
          begin
            if A[i][j] <> B[i][j] then
            begin
              for k := 1 to Level do
                temp := temp + A[i][j] + A[i][j];
            end
            else
              temp := temp + A[i][j];
          end;
          for j := length(A[i]) + 1 to length(B[i]) do
            temp := temp + ' ' + A[i][length(A[i])];
        end;
        if temp = A[i] then
        begin
          temp := RandomWordInFile(Language, length(A[i]));
          writeln(' a[i] = ', temp);
        end; // else ��������� ������
        s := s + ' ' + temp;
          if probely[i] = true then s := s + ' ' + A[i][Length(A[i])];
      end;

      for i := length(B) to length(A) - 1 do
      begin
        for j := 1 to length(A[i]) do
        begin
          for k := 1 to Level do
            temp := temp + A[i][j] + A[i][j];
        end;

        s := s + ' ' + temp;
      end;
    end;


    if length(A) < length(B) then
    begin
      for i := 0 to length(A) - 1 do
      begin
        // setlength(mass, length(A[i]));

        if length(A[i]) = length(B[i]) then
        begin
          temp := '';
          for j := 1 to length(B[i]) do
          begin
            if A[i][j] <> B[i][j] then
            begin
              f := false;
              for k := 1 to Level do
                temp := temp + A[i][j] + A[i][j];
            end
            else
              temp := temp + A[i][j];
          end;
        end;

        if length(A[i]) > length(B[i]) then
        begin
          temp := '';
          f := false;
          for j := 1 to length(B[i]) do
          begin
            if A[i][j] <> B[i][j] then
            begin
              for k := 1 to Level do
                temp := temp + A[i][j] + A[i][j];
            end
            else
              temp := temp + A[i][j];
          end;
          for j := length(B[i]) + 1 to length(A[i]) do
            for k := 1 to Level do
              temp := temp + A[i][j] + A[i][j];
        end;

        if length(A[i]) < length(B[i]) then
        begin
          temp := '';
          f := false;
          for j := 1 to length(A[i]) do
          begin
            if A[i][j] <> B[i][j] then
            begin
              for k := 1 to Level do
                temp := temp + A[i][j] + A[i][j];
            end
            else
              temp := temp + A[i][j];
          end;
          for j := length(A[i]) + 1 to length(B[i]) do
            temp := temp + ' ' + A[i][length(A[i])];
        end;
        if temp = A[i] then
        begin
          temp := RandomWordInFile(Language, length(A[i]));
          writeln(' a[i] = ', temp);
        end; // else ��������� ������
        s := s + ' ' + temp;
        if probely[i] = true then s := s + ' ' + A[i][Length(A[i])];
      end;

      temp := '';
      for j := length(A) to length(B) - 1 do
      begin
        temp := temp + ' ' + A[length(A) - 1][length(A[length(A) - 1])];

      end;
      temp := copy(temp, 2, length(temp) - 1);
      s := s + ' ' + temp;
    end;
  end
  else
  begin
    if length(A) = length(B) then
    begin
      for i := 0 to length(A) - 1 do
      begin
        // setlength(mass, length(A[i]));
        temp := A[i];
        if A[i] <> B[i] then
        begin

          f := false;
          for k := 1 to Level - 2 do
            temp := temp + ' ' + A[i];
        end;
        if temp = A[i] then

        begin
          temp := RandomWordInFile(Language, length(A[i]));
          writeln(' a[i] = ', temp);
        end; // else ��������� ������
        s := s + ' ' + temp;
        if probely[i] = true then s := s + ' ' + A[i][Length(A[i])];
      end;

    end;

    if length(A) > length(B) then
    begin
      f := false;
      for i := 0 to length(B) - 1 do
      begin
        // setlength(mass, length(A[i]));
        temp := A[i];
        if A[i] <> B[i] then
        begin

          for k := 1 to Level - 2 do
            temp := temp + ' ' + A[i];
        end;

        if temp = A[i] then

        begin
          temp := RandomWordInFile(Language, length(A[i]));
          writeln(' a[i] = ', temp);
        end; // else ��������� ������
        s := s + ' ' + temp;
        if probely[i] = true then s := s + ' ' + A[i][Length(A[i])];
      end;

      for i := length(B) to length(A) - 1 do
      begin
       temp := A[i];
        for k := 1 to Level do
          temp := temp + ' ' + A[i];
       { if temp = A[i] then
        begin
          temp := RandomWordInFile(Language, length(A[i]));
          writeln(' a[i] = ', temp);
        end; // else ��������� ������  }
        s := s + ' ' + temp;
      end;
    end;

    if length(A) < length(B) then
    begin
    posledniye := A[length(A) - 1];
      for i := 0 to length(A) - 1 do
      begin
        // setlength(mass, length(A[i]));
        temp := A[i];
        if A[i] <> B[i] then
        begin

          for k := 1 to Level - 2 do
            temp := temp + ' ' + A[i];
        end;

        if temp = A[i] then
        begin
          temp := RandomWordInFile(Language, length(A[i]));
          writeln(' a[i] = ', temp);
        end; // else ��������� ������
        s := s + ' ' + temp;
        if probely[i] = true then s := s + ' ' + A[i][Length(A[i])];
      end;



      for j := length(A) to length(B) - 1 do
      begin
        s := s + ' ' + posledniye[length(posledniye)];
      end;
    end;
  end;
  s := copy(s, 2, length(s) - 1);
end;

procedure CreateDirectoryOfFiles (var Language: integer; var ArrOfFiles: TRef);
var
  dir:string;
  lang:ansichar;
  count:string;
begin
  dir := GetCurrentDir();
  if Language = 1 then
    lang := 'R'
  else
    lang := 'E';
  for var i := 1 to 8 do
  begin
    ArrOfFiles[i] := Concat(dir , '\Files\Words' , lang , IntToStr(i), '.txt');
  end;
end;

procedure ChooseLanguage(var Language: integer); // ���������� ���������� Language (1 - �������, 2 - ����������)
var
  F: Boolean;
  lengstr: string;
begin
  F := false;
  Writeln('�������� ���� ���� : �������(1) / English(2)');
  while not (F = true) do
  begin
    Readln(Lengstr);
    if (Lengstr = '1') or (Lengstr = '2') then
    begin
    language := strtoint(lengstr);
      if Lengstr = '1' then
      begin
      Writeln('������ ���� ���� : �������' );
      CreateDirectoryOfFiles(Language, Ref);
      end
      else
      begin
      Writeln('������ ���� ���� : English' );
      CreateDirectoryOfFiles(Language, Ref);
      end;
      F := true;

    end
    else
      Writeln('������� ������������ ������. �������� ���������� ���� ����: �������(1) / English(2)');
  end;

end;

procedure ReformInMas(S: string; var MasWords: Tstring; var X : TBool);
var
  i, index, kol_slov, lastletter: Integer;
begin
lastletter := length(s);
while s[lastletter] = ' ' do lastletter := lastletter - 1;

setlength(X, 0);
Setlength(MasWords, 0);
  i := 2;
  index := 1;
  kol_slov := 0;
  while (i < lastletter) do
  begin
   if (s[i] = ' ') and (s[i-1] <> ' ')  then
   begin
   Setlength(MasWords, length(masWords) + 1);
   MasWords[length(MasWords)- 1] := copy(s, index, i - index);
   index := i + 1;
   kol_slov := kol_slov + 1;
   setlength(X, kol_slov);
   if s[i+1] = ' ' then
     begin
      X[kol_slov - 1] := true;
      index := index + 1;
     end
    else X[kol_slov - 1] := false;


   end;
   while s[index] = ' ' do index := index + 1;
   i := i + 1;
  end;
  Setlength(MasWords, length(masWords) + 1);
  MasWords[length(MasWords)- 1] := copy(s, index, lastletter - index + 1);
  kol_slov := kol_slov + 1;
   setlength(X, kol_slov);
   if lastletter = length(s) then x[kol_slov - 1] := false else x[kol_slov - 1] := true;

end;

begin
  ChooseLanguage(Language);
  CurrStr := 'asd zxc';
  writeln(CurrStr);


  while (true) do
  begin

    Level := 2;
    readln(InputStr);
    if InputStr = '13' then break;

    ReformInMas(CurrStr, MasWords_CurrStr,probely);
    ReformInMas(InputStr, InputStr_TempStr,probely);
    proverka(MasWords_CurrStr, InputStr_TempStr, Level, CurrStr,probely, language);
    writeln(CurrStr);

  end;

readln;

end.

