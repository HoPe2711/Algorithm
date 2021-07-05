//{$H+}
uses math;
var st:array[0..2000,0..2000] of char;
    b:array[0..200] of char;
    st1:String;
    n,m,kq,res,tmp:longint;
procedure nhap;
var i,j,k:longint; s:char;
begin
 readln(n,m);
 for i:=1 to n do
 begin
  for j:=1 to m do read(St[i,j]);
  readln;
 end;
// readln(st1); readln(St1);
 for i:=1 to 2 do
 begin
  for j:=1 to 2 do read(b[(i-1)*2+j]);
  readln;
 end;

 for i:=1 to n do
  for j:=1 to m do
  if (i>1) and (j>1) then
   if (st[i-1][j-1]=b[1]) and (st[i-1][j]=b[2]) and (st[i][j-1]=b[3]) and (st[i][j]=b[4]) then inc(res);
 kq:=res;
 for i:=1 to n do
  for j:=1 to m do
  for k:=1 to 4 do
   begin
   // if k=1 then s:='J' else if k=2 then s:='O' ELSE s:='I';
    s:=b[k];
    if s=st[i][j] then continue;
    tmp:=res;
    if (i>1) and (j>1) then
     if (st[i-1][j-1]=b[1]) and (st[i-1][j]=b[2]) and (st[i][j-1]=b[3]) and (st[i][j]=b[4]) then dec(tmp)
     else
     if (st[i-1][j-1]=b[1]) and (st[i-1][j]=b[2]) and (st[i][j-1]=b[3]) and (s=b[4]) then inc(tmp);


    if (i>1) and (j<m) then
     if (st[i-1][j]=b[1]) and (st[i][j]=b[3]) and (st[i][j+1]=b[4]) and (st[i-1][j+1]=b[2]) then dec(tmp)
     else
     if (st[i-1][j]=b[1]) and (s=b[3]) and (st[i][j+1]=b[4]) and (st[i-1][j+1]=b[2]) then inc(tmp);


    if (i<n) and (j>1) then
     if (st[i+1][j-1]=b[3]) and (st[i][j]=b[2]) and (st[i][j-1]=b[1]) and (st[i+1][j]=b[4]) then DEC(TMP)
     else
     if (st[i+1][j-1]=b[3]) and (s=b[2]) and (st[i][j-1]=b[1]) and (st[i+1][j]=b[4]) then inc(TMP);


    if (i<n) and (j<m) then
     if (st[i][j]=b[1]) and (st[i][j+1]=b[2]) and (st[i+1][j]=b[3]) and (st[i+1][j+1]=b[4]) then dec(tmp)
     else
    if (s=b[1]) and (st[i][j+1]=b[2]) and (st[i+1][j]=b[3]) and (st[i+1][j+1]=b[4]) then inc(tmp);

    kq:=max(kq,tmp);
   end;
 write(kq);
end;
begin
// assign(input,'a.inp');reset(input);
// assign(output,'a.out');rewrite(output);
 nhap;
// close(input); close(output);
end.