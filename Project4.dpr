program Project23;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;


type
  Tstring = array of string;
  TRef = array [1 .. 8] of string;
 // else A[i] := RandomWordInFile(Language,Length(a[i]));
var
  Ref: TRef =
  (
    'D:\WORK\laba\OAP\8\RussianWordsR1.txt',
    'D:\WORK\laba\OAP\8\RussianWordsR2.txt',
    'D:\WORK\laba\OAP\8\RussianWordsR3.txt',
    'D:\WORK\laba\OAP\8\RussianWordsR4.txt',
    'D:\WORK\laba\OAP\8\RussianWordsR5.txt',
    'D:\WORK\laba\OAP\8\RussianWordsR6.txt',
    'D:\WORK\laba\OAP\8\RussianWordsR7.txt',
    'D:\WORK\laba\OAP\8\RussianWordsR8.txt'
    );

 // Ref: TRef; // Ref - массив ссылок на текстовые файлы
  CurrStr, InputStr: string;
  InputStr_inMas, OutputStr_inMas, MasWords_CurrStr, MasWords_TempStr, InputStr_TempStr: Tstring;
  currWord, TempStr: string;
  n: integer;
  Language: integer = 1;
  CountOfLetters: integer;
Level: integer;
  gggg:integer;

function RandomWordInFile(var Language: integer;const CountOfLetters: integer): string;
var
  str:string;
  currFile: TextFile;
  n: byte;
  mas_size_words: array of integer;
  number_letters_word: integer;
  letters_left: integer;
  i: integer;
begin
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
    AssignFile(currFile, Ref[ mas_size_words[i]]);
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
     result := result  + str;
  end;
end;

procedure proverka(var A, B : array of string; var level : integer; var s : string);
var i, j, k : integer;
f : boolean;
temp : string;
mass : array of integer;
begin
 s := '';
f := true;
if level <= 2 then
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
            for k := 1 to level do temp := temp + A[i][j] + A[i][j];
            end
            else temp := temp + A[i][j];
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
            for k := 1 to level do temp := temp + A[i][j] + A[i][j];
            end
            else temp := temp + A[i][j];
          end;
        for j := length(B[i]) + 1 to length(A[i]) do
        for k := 1 to level do temp := temp + A[i][j] + A[i][j];
        end;


        if length(A[i]) < length(B[i]) then
        begin
        temp := '';
        f := false;
        for j := 1 to length(A[i]) do
          begin
          if A[i][j] <> B[i][j] then
            begin
            for k := 1 to level do temp := temp + A[i][j] + A[i][j];
            end
            else temp := temp + A[i][j];
          end;
          for j := length(A[i]) + 1 to length(B[i]) do temp := temp + ' ' + A[i][length(A[i])];
        end;
       if temp <> A[i] then A[i] := temp else A[i] := RandomWordInFile(Language,Length(a[i])); //else программа Даника
      s := s + ' ' + temp;
      end;

    end;


  if length(A) > length(B) then
    begin
    f := false;
    for i := 0 to length(B) - 1 do
      begin
      //setlength(mass, length(A[i]));


       if length(A[i]) = length(B[i]) then
        begin
        temp := '';
        for j := 1 to length(B[i]) do
          begin
          if A[i][j] <> B[i][j] then
            begin
            for k := 1 to level do temp := temp + A[i][j] + A[i][j];
            end
            else temp := temp + A[i][j];
          end;
        end;


        if length(A[i]) > length(B[i]) then
        begin
        temp := '';
        for j := 1 to length(B[i])  do
          begin
          if A[i][j] <> B[i][j] then
             begin
            for k := 1 to level do temp := temp + A[i][j] + A[i][j];
            end
            else temp := temp + A[i][j];
          end;
        for j := length(B[i]) + 1 to length(A[i])  do
        for k := 1 to level do temp := temp + A[i][j] + A[i][j];
        end;


       if length(A[i]) < length(B[i]) then
        begin
        temp := '';
        f := false;
        for j := 1 to length(A[i]) do
          begin
          if A[i][j] <> B[i][j] then
            begin
            for k := 1 to level do temp := temp + A[i][j] + A[i][j];
            end
            else temp := temp + A[i][j];
          end;
          for j := length(A[i]) + 1 to length(B[i]) do temp := temp + ' ' + A[i][length(A[i])];
        end;
       if temp <> A[i] then A[i] := temp else A[i] := RandomWordInFile(Language,Length(a[i])); //else программа Даника
      s := s + ' ' + temp;
      end;

      for i := length(B) to length(A) - 1 do
      begin
      for j := 1 to length(A[i]) do
        begin
        for k := 1 to level do temp := temp + A[i][j] + A[i][j];
        end;
      A[i] := temp;
      s := s + ' ' + temp;
      end;
    end;


  if length(A) < length(B) then
    begin
    for i := 0 to length(A) - 2 do
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
            for k := 1 to level do temp := temp + A[i][j] + A[i][j];
            end
            else temp := temp + A[i][j];
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
            for k := 1 to level do temp := temp + A[i][j] + A[i][j];
            end
            else temp := temp + A[i][j];
          end;
        for j := length(B[i]) + 1 to length(A[i]) do
        for k := 1 to level do temp := temp + A[i][j] + A[i][j];
        end;


        if length(A[i]) < length(B[i]) then
        begin
        temp := '';
        f := false;
        for j := 1 to length(A[i]) do
          begin
          if A[i][j] <> B[i][j] then
            begin
            for k := 1 to level do temp := temp + A[i][j] + A[i][j];
            end
            else temp := temp + A[i][j];
          end;
          for j := length(A[i]) + 1 to length(B[i]) do temp := temp + ' ' + A[i][length(A[i])];
        end;
       if temp <> A[i] then A[i] := temp else A[i] := RandomWordInFile(Language,Length(a[i])); //else программа Даника
      s := s + ' ' + temp;
      end;
     temp := A[length(A)-1];
    for j := length(A) to length(B) - 1 do
      begin
      temp := temp + ' ' + A[length(A)-1][length(A[length(A)-1])];
      end;
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


       if A[i] <> B[i] then
       begin
       temp := '';
       f := false;
       for k := 1 to level - 2 do temp :=  A[i] + ' ' + A[i];
       end;
       if temp <> A[i] then A[i] := temp else A[i] := RandomWordInFile(Language,Length(a[i])); //else программа Даника
      s := s + ' ' + temp;
      end;

    end;


  if length(A) > length(B) then
    begin
    f := false;
    for i := 0 to length(B) - 1 do
      begin
      //setlength(mass, length(A[i]));


      if A[i] <> B[i] then
       begin
       temp := '';
       for k := 1 to level - 2 do temp :=  A[i] + ' ' + A[i];
       end;

       if temp <> A[i] then A[i] := temp else A[i] := RandomWordInFile(Language,Length(a[i]));//else программа Даника
      s := s + ' ' + temp;
      end;

      for i := length(B) to length(A) - 1 do
      begin

        for k := 1 to level do temp := A[i] + ' ' + A[i];
       if temp <> A[i] then A[i] := temp else A[i] := RandomWordInFile(Language,Length(a[i])); //else программа Даника
      s := s + ' ' + A[i];
      end;
    end;


  if length(A) < length(B) then
    begin
    for i := 0 to length(A) - 2 do
      begin
     // setlength(mass, length(A[i]));


       if A[i] <> B[i] then
       begin
       temp := '';
       for k := 1 to level - 2 do temp :=  A[i] + ' ' + A[i];
       end;

       if temp <> A[i] then A[i] := temp else A[i] := RandomWordInFile(Language,Length(a[i])); //else программа Даника
      s := s + ' ' + temp;
      end;
     temp := A[length(A)-1];
     if A[length(A)-1] <> B[length(A)-1] then
     begin
     for k := 1 to level - 2 do temp :=  A[i] + ' ' + A[i];
     end;
     if temp <> A[i] then A[i] := temp else A[i] := RandomWordInFile(Language,Length(a[i])); //else программа Даника
      s := s + ' ' + A[i];

    for j := length(A) to length(B) - 1 do
      begin
      s := s + ' ' + temp[length(temp)];
      end;
    end;
  end;
 s := copy(s, 2, length(s)-1);
end;

procedure ReformInMas(S: string; var MasWords: Tstring);
var
  i, index: Integer;
begin
Setlength(MasWords, 0);
  i := 1;
  index := 1;
  while (i <= length(S)) do
  begin
   if (s[i] = ' ') or (i = length(s)) then
   begin
   Setlength(MasWords, length(masWords) + 1);
   MasWords[length(MasWords)- 1] := copy(s, index, i - index);
   index := i + 1;
   end;
   i := i + 1;
  end;

end;







begin
 CurrStr := 'йцукен как';
   writeln(currStr);
   while true do
   begin
   level := 1;
   Readln(InputStr);
   ReformInMas(CurrStr, MasWords_CurrStr);
    ReformInMas(InputStr, InputStr_TempStr);
    proverka(MasWords_CurrStr, InputStr_TempStr, Level, CurrStr);
   writeln(currStr);

   end;
    READLN;
end.
