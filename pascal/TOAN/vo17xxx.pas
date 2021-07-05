uses math;
const base=1000000007;
var  free,s:array[0..6000] of longint;
     a:array[0..100000] of longint;
     f,g:array[0..30000000] of longint;
     sn,n,res,c,maxx:longint;
procedure snt(n:longint);
var  i,j:longint;
begin
 for i:=2 to trunc(sqrt(n)) do
  if free[i]=0 then
   begin
    j:=i*i;
    while j<=n do
     begin
      free[j]:=1;
      j:=j+i;
     end;
   end;
 for i:=2 to n do
  if free[i]=0 then
   begin
    inc(sn);
    s[sn]:=i;
   end;
end;
function pow(a,x:longint):longint;
var tg:longint;
begin
 if x=0 then exit(1);
 tg:=pow(a,x div 2);
 tg:=int64(tg)*tg mod base;
 if x mod 2=0 then exit(tg)
 else exit(int64(a)*tg mod base);
end;
procedure nhap;
var  i,j:longint;
begin
 reaD(n,c);
 if c=1 then
  begin
   writeln((pow(2,n)-1+base) mod base);
   halt;
  end;
 for i:=1 to n do
  begin
   read(a[i]);
   maxx:=max(maxx,a[i]);
  end;
end;
procedure xuli;
var i,j,dem,aa:longint;
begin
 for i:=1 to n do
  for j:=1 to trunc(sqrt(a[i])) do
  if a[i] mod j=0 then
    begin
     inc(f[j]);
     if j<>a[i] div j then inc(f[a[i] div j]);
    end;
 for i:=maxx downto 1 do
 if f[i]>0 then
  begin
   g[i]:=(pow(2,f[i])-1+base) mod base;
   j:=2;
   while int64(j)*i<=maxx do
    begin
     g[i]:=(g[i]-g[int64(i)*j]+base) mod base;
     inc(j);
    end;
  end;
 for i:=1 to maxx do
  if g[i]>0 then
   begin
    j:=1;     aa:=i;   dem:=0;
    while j<=sn do
     begin
      if aa=1 then break;
      if aa mod s[j]=0 then inc(dem);
      while aa mod s[j]=0 do aa:=aa div s[j];
      inc(j);
     end;
    if aa<>1 then inc(dem);
    res:=(res+int64(g[i])*pow(c,dem) mod base) mod base;
   end;
 write(res);
end;
begin
 assign(input,'vo17xxx.inp');reset(input);
 assign(output,'vo17xxx.out');rewrite(output);
 snt(5500);
 nhap;
 xuli;
 close(input); close(output);
end.