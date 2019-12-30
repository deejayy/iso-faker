{$APPTYPE CONSOLE}

uses crt;

type

  fsiz = record
    case longint of
      1: (b1: byte;
         b2: byte;
         b3: byte;
         b4: byte;);
      2: (l1: longword;)
    end;

  leng = record
    case longint of
      1: (b1: byte;
         b2: byte;);
      2: (l1: word;)
    end;


var

  f     : file of byte;
  a     : array of byte;

  fs, i : integer;
  er    : integer;

  k     : fsiz;
  l     : leng;

BEGIN
  randomize;

  assignfile( f, paramstr( 1 ) );
  reset( f );
  fs := filesize( f );
  setlength( a, fs+1 );
  blockread( f, a[0], fs );
  closefile( f );

  i := 0;
  while i < fs do begin
    inc(i);
//    if a[i]=$AB then a[i]:=$BB;
    if i = $88050 then
      writeln( 'gotcha' );
    if (a[i+0] = $AB) and
       (a[i+1] = 0) and
       (a[i+2] = 0) and
       (a[i+3] = 0) then begin
      k.b1 := a[i+0];
      k.b2 := a[i+1];
      k.b3 := a[i+2];
      k.b4 := a[i+3];
      l.b1 := a[i+22];
      l.b2 := a[i+23];
      if (chr(a[i+l.l1+14]) = 'm') and (chr(a[i+l.l1+16]) = 'p') and (chr(a[i+l.l1+18]) = '3') then begin
        k.l1 := random( 14217728 ) + 60000000;
      end;
      if (chr(a[i+l.l1+14]) = 'a') and (chr(a[i+l.l1+16]) = 'v') and (chr(a[i+l.l1+18]) = 'i') then begin
        k.l1 := random( 40000000 ) + 714003200;
      end;
      if (chr(a[i+l.l1+14]) = 'r') and (chr(a[i+l.l1+16]) = 'a') and (chr(a[i+l.l1+18]) = 'r') then begin
        k.l1 := random( 8388608 ) + 2097152;
        er := k.l1;
      end;
      if (chr(a[i+l.l1+14]) = 'r') and (chr(a[i+l.l1+16]) = '0') and (chr(a[i+l.l1+18]) in ['0'..'9']) then begin
        k.l1 := er;
      end;
      a[i+0] := k.b1;
      a[i+1] := k.b2;
      a[i+2] := k.b3;
      a[i+3] := k.b4;
    end;
  end;

  assignfile( f, '2' + paramstr( 1 ) );
  rewrite( f );
  blockwrite( f, a[0], fs );
  closefile( f );
END.


      if (chr(a[i+32]) = 'M') and (chr(a[i+33]) = 'P') and (chr(a[i+34]) = '3') then begin
        k.l1 := random( 14217728 ) + 60000000;
      end;
      if (chr(a[i+32]) = 'A') and (chr(a[i+34]) = 'V') and (chr(a[i+36]) = 'I') then begin
        k.l1 := random( 40000000 ) + 714003200;
      end;

