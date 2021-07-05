var res,n,m,s:longint;
    a:array[0..20,0..50000] of longint;
    b:array[0..50000,0..20] of longint;
    hang,cot:array[0..50000] of longint;
procedure nhap;
begin
 read(m,n,s);
end;
procedure xuli;
var i,j,ans,x:longint;
begin
 for i:=1 to m do
  for j:=1 to n do read(a[i,j]);
 //read(S);
 for i:=1 to s do
  begin
   read(x);
   if x<=m then inc(hang[x])
   else inc(Cot[x-m]);
  end;
 for i:=1 to m do
  for j:=1 to n do
   begin
    ans:=(cot[j]+hang[i]) mod 3;
    a[i,j]:=(a[i,j]+ans) mod 3;
    if a[i,j]=0 then inc(res);
   end;
 write(res);
end;
procedure xuli1;
var i,j,ans,x:longint;
begin
 for i:=1 to m do
  for j:=1 to n do read(b[i,j]);
 //read(S);
 for i:=1 to s do
  begin
   read(x);
   if x<=m then inc(hang[x])
   else inc(Cot[x-m]);
  end;
 for i:=1 to m do
  for j:=1 to n do
   begin
    ans:=(cot[j]+hang[i]) mod 3;
    b[i,j]:=(b[i,j]+ans) mod 3;
    if b[i,j]=0 then inc(res);
   end;
 write(res);
end;
begin
 assign(input,'lisys.inp');reset(input);
 assign(output,'lisys.out');rewrite(output);
 nhap;
 if (m<=20) and (n<=50000) then xuli
 else xuli1;
 close(input); close(output);
end.