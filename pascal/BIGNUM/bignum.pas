{$H+}
uses math;
type
  arr = array[0..10001] of longint;

var
  a,b,res : arr;
  dem : longint;
  st1,st2 : string;

procedure nhap;
  var

    i,x,y : longint;
  begin
    readln(st1);
    readln(st2);
    while length(st1)<length(st2) do st1:='0'+st1;
    while length(st2)<length(st1) do st2:='0'+st2;
    a[0]  :=  length(st1);
    b[0]  :=  length(st2);
    for i :=  1 to length(st1) do
      begin
        val(st1[i],x,y);
        a[i]  :=  x;
      end;
    for i :=  1 to length(st2) do
      begin
        val(st2[i],x,y);
        b[i]  :=  x;
      end;
  end;

function cong(a,b : arr)  : arr;
  var
    nho,i,x : longint;
    c : arr;
  begin
    dem  :=  0;
    nho :=  0;
    for i :=  max(a[0],b[0]) downto 1 do
      begin
        x :=  a[i]  + b[i]  + nho;
        nho :=  x div 10;
        x :=  x mod 10;
        c[i]  :=  x;
        inc(dem);
      end;
    c[0]  :=  nho;
    exit(c);
  end;

procedure xuli_add;
  var
    i : longint;
  begin

    res :=  cong(a,b);
    if res[0] <>  0  then
     for i :=  0 to dem do write(res[i])
    else
      for i :=  1 to dem do write(res[i]);
  end;

function tru(a,b  :arr) : arr;
  var
    nho,i,x : longint;
    c : arr;
  begin

    a[0]  :=  length(st1);
    b[0]  :=  length(st2);
    nho :=  0;
    dem :=  0;
    for i :=  max(a[0],b[0]) downto 1 do
      begin
        x :=  a[i]  - b[i]  - nho;
        nho :=  0;
        if x  < 0  then
          begin
            x :=  x + 10;
            nho :=  1;
          end;
        c[i]  :=  x;
        inc(dem);
      end;
    exit(c);
  end;

procedure xuli_tru;
  var
    i,vt,ok,tmp : longint;
  begin
      ok:=0;
      i:=1;
      while (i<=length(a)) and (a[i]=b[i]) do inc(i);
      if i>length(a) then
        begin
         write('0');
         exit
        end;
      if a[i]<b[i] then
       begin
        res:=tru(b,a);
        ok:=1;
       end
      else res:=tru(a,b);

     if ok=1 then write('-');
     tmp:=1;
     while res[tmp]=0 do inc(tmp);
     for i:= tmp to dem do write(res[i]);
  end;

function nhan(a,b : arr)  : arr;
  var
    i,j,dem,x,nho, m,n  : longint;
    c : arr;
  begin
    fillchar(c,sizeof(c),0);
    a[0]  :=  length(st1);
    b[0]  :=  length(st2);
    m :=  a[0]; n :=  b[0];
    for i :=  m downto 1 do
      for j :=  n downto 1 do
        c[i+j-1]  :=  c[i+j-1]  + a[i]  * b[j];
    nho := 0;
    for i :=  m+n-1 downto 1 do
      begin
        x :=  c[i]+nho;
        nho :=  x div 10;
        x :=  x mod 10;
        c[i]  :=  x;
      end;
    c[0]  :=  nho;
    exit(c);
  end;

procedure xuli_nhan;
  var
    i,j : longint;
  begin

    res :=  nhan(a,b);
    //if res[0] <> 0 then write(res[0]) ;
    i:=0;
    while res[i]=0 do inc(i);
    for j :=  i to a[0]+b[0]-1 do write(res[j]) ;

  end;

begin
  //assign(input, 'bignum.inp'); reset(input);
  //assign(output,'bignum.out'); rewrite(output);
  nhap;
  xuli_add;
  writeln;
  xuli_tru;
  writeln;
  xuli_nhan;
  //close(input); close(output);
end.
