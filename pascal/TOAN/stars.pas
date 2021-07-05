{$H+}
var n,res:longint;
    st:String;
    dd:array['a'..'z'] of longint;
    a:array[0..75,0..75,0..75] of char;
procedure nhap;
var i,j,k,dem:longint;
begin
 readln(n);
 for i:=1 to n do
  begin
   readln(st);    dem:=1; k:=0;
   for j:=1 to length(st) do
    if (ord(st[j])>=97) and (ord(st[j])<=122) then
     begin
      if k<n then
       begin
        inc(k);
        a[i,dem,k]:=st[j];
       end
      else
       begin
        k:=1;
        inc(dem);
        a[i,dem,k]:=st[j];
       end;
     end;
  end;
end;
function check(i,j,k:longint):boolean;
var
    ok:boolean;
begin
 ok:=false;
 if (i-1>0) and (i+1<=n) and (j+1<=n) and (j-1>0) and (k-1>0) and (k+1<=n) then
 if (a[i,j,k]=a[i,j,k+1]) and (a[i,j,k]=a[i,j,k-1]) and (a[i,j,k]=a[i+1,j,k]) and (a[i,j,k]=a[i-1,j,k]) and (a[i,j,k]=a[i,j+1,k]) and (a[i,j,k]=a[i,j-1,k]) then ok:=true;
 exit(ok);
end;
procedure xuli;
var i,j,k:longint;
    tt:char;
begin
 for i:=2 to n-1 do
  for j:=2 to n-1 do
   for k:=2 to n-1 do
    if check(i,j,k) then
     begin
      inc(Res);
      inc(dd[a[i,j,k]]);
     end;
  writeln(Res);
  for tt:='a' to 'z' do
  if dd[tt]<>0 then writeln(tt,' -> ',dd[tt]);
end;
BEGIN
  assign(input,'stars.inp');reset(input);
  assign(output,'stars.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.
