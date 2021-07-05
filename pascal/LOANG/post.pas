{$H+}
uses math;
const q: array[1..8] of longint = (1,-1,1,-1,1,-1,0,0);
      q1: array[1..8] of longint = (-1,-1,1,1,0,0,1,-1);
      oo=10000000;
var n,res,hg,sep,sep1,f,r,x,y:longint;
    st:array[0..500] of string;
    dd,a:array[0..500,0..500] of longint;
    b,queu,queu1:array[0..2500000] of longint;
    free,tt:array[0..50,0..50] of boolean;
procedure nhap;
var i,j,dem:longint;
begin
 readln(n);
 dem:=0;
 for i:=1 to n do readln(st[i]);
 for i:=1 to n do
   for j:=1 to length(st[i]) do
    if st[i][j]='K' then
     begin
      dd[i,j]:=1;
      inc(hg);
     end
    else if st[i,j]='P' then
     begin
      sep:=i;
      sep1:=j;
      dd[i,j]:=2;
     end;
// readln;
 for i:=1 to n do
  for j:=1 to n do
   begin
    read(a[i,j]);
    inc(dem);
    b[dem]:=a[i,j];
   end;
end;
Procedure doicho(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort(l,r:longint);
Var
  i,j,key:longint;
  Begin
    i:=l;
    j:=r;
    key:=b[(l+r) div 2];
    repeat
      while b[i] < key do inc(i);
      while b[j] > key do dec(j);
      if i <= j then
      Begin
      doicho(B[i],b[j]);
      inc(i);
      dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;

procedure push(i,j:longint);
begin
 inc(r);
 queu[r]:=i;
 queu1[r]:=j;
end;
procedure pop;
begin
 x:=queu[f];
 y:=queu1[f];
 inc(f);
end;
function check(hmin,hmax:longint):boolean;
var  i,kk,u,v:longint;
begin
 f:=1; r:=0;    kk:=0;
 fillchar(free,sizeof(free),true);
 fillchar(tt,sizeof(tt),true);
 push(sep,sep1);
 while f<=r do
  begin
   pop;
   if kk=hg then exit(true);
   for i:=1 to 8 do
    begin
     u:=x+q[i];
     v:=y+q1[i];
     if (u<=n) and (v<=n) and (u>=1) and (v>=1) then
      if (hmin<=a[u,v]) and (hmax>=a[u,v]) then
      if tt[u,v] then
       begin
        if (dd[u,v]=1) and (free[u,v]) then
         begin
          inc(kk);
          free[u,v]:=false;
         end;
        tt[u,v]:=false;
        push(u,v);
       end;
    end;
  end;
  exit(false);
end;



procedure xuli;
var i,j:longint;
begin
 res:=oo;
 qsort(1,n*n);
 j:=1;
 for i:=1 to n*n do
  begin
   while check(b[i],b[j])=false do
    begin
     inc(j);
     if j>n*n then break;
    end;
   if j>n*n then break;
   res:=min(res,b[j]-b[i]);
  end;
 write(res);
end;
BEGIN
  assign(input,'post.inp');reset(input);
  assign(output,'post.out');rewrite(output);
    Nhap;
    Xuli;
  close(input);close(output);
END.
