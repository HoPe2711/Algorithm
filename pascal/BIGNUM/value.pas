{$H+}
uses math;
type arr=array[0..20000] of longint;
var n:longint;
    st:string;
    a,b,kq:arr;
function cong(a,b:arr):arr;
var
    nho,i,x,dem : longint;  c:arr;
  begin
    fillchar(c,sizeof(c),0);
    dem  :=  0;
    nho :=  0;
    for i :=1 to  max(a[0],b[0]) do
      begin
        x :=  a[i]  + b[i]  + nho;
        nho :=  x div 10;
        x :=  x mod 10;
        c[i]  :=  x;
        inc(dem);
      end;
    if nho<>0 then
     begin
      inc(dem);
      c[dem]:=nho;
     end;
    c[0]:=dem;
    exit(c);
  end;
function nhan(a : arr;b1:longint): arr;
  var
    i,j,dem,x,nho, m,n  : longint;
    b2,c : arr;
  begin
    fillchar(c,sizeof(c),0);
    fillchar(b2,sizeof(b2),0);
    b2[0]  := 1; b2[1]:=b1;
    m :=  a[0]; n :=  b2[0];
    dem:=0;
    for i := 1 to m do
      for j := 1 to n do
        c[i+j-1]  :=  c[i+j-1]  + a[i]  * b2[j];
    nho := 0;
    for i :=1 to m+n-1 do
      begin
        x :=  c[i]+nho;
        nho :=  x div 10;
        x :=  x mod 10;
        c[i]  :=  x;
        inc(dem);
      end;
    if nho<>0 then
     begin
      inc(dem);
      c[dem]:=nho;
     end;
    c[0]:=dem;
    exit(c);
  end;
procedure nhap;
var i:longint;
begin
 read(st);
 n:=length(st);
 a[1]:=1; b[1]:=0; a[0]:=1; b[0]:=1;
 for i:=n downto 1 do
 begin
  if st[i]='L' then
   begin
    a:=nhan(a,2);
   end;
  if st[i]='R' then
   begin
    b:=cong(a,b);
    a:=nhan(a,2);
   end;
  if st[i]='*' then
   begin
    b:=cong(nhan(b,3),a);
    a:=nhan(a,5);
   end;
 end;
 kq:=cong(a,b);
 for i:=kq[0] downto 1 do write(kq[i]);
end;
begin
 assign(input,'value.inp');reset(input);
 assign(output,'value.out');rewrite(output);
 nhap;
 close(input); close(output);
end.