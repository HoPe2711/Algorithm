uses math;
type matrix=array[0..51,0..51] of longint;
var b:Array[0..51] of longint;
    n,d,t,h:longint;
    f,m,trans:matrix;
operator *(a,b:matrix)c:matrix;
var i,j,k,kq:longint;
begin
 for i:=1 to d do
  for j:=1 to d do
  begin
   kq:=0;
   for k:=1 to d do kq:=(kq+a[i,k]*b[k,j]);
   c[i,j]:=(kq+3) mod 3;
  end;
 //exit(C);
end;
function pow(a:matrix;b:int64):matrix;
var  tg:matrix;
begin
 if b=1 then exit(A);
 tg:=pow(a,b div 2);
 tg:=tg*tg;
 if b mod 2=1 then exit(tg*a)
 else exit(tg);
end;
procedure nhap;
var i:longint;
begin
 read(n,d);
 for i:=1 to d do
  begin
   read(b[i]);
   b[i]:=max(b[i],0);
  end;
end;
procedure xuli;
var i,j:longint;// trans:matrix;
begin
 for i:=1 to 51 do
  for j:=1 to 51 do
   begin
    m[i,j]:=0;
    f[i,j]:=0;
   end;
 m[d,1]:=1;
 for i:=2 to d do m[d,i]:=-1;
 for i:=1 to d-1 do m[i,i+1]:=1;
 for i:=1 to d do f[i,1]:=b[d-i+1];
 trans:=pow(m,n-1);
 trans:=trans*f;
 for i:=d downto 1 do write(trans[i,1],' ');
 writeln;
end;
begin
 assign(input,'recurr.inp');reset(input);
 assign(output,'recurr.out');rewrite(output);
 read(t);
 for h:=1 to t do
  begin
   nhap;
   xuli;
  end;
 close(input); close(output);
end.
