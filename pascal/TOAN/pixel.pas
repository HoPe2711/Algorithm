var n,w,h:longint;
    a,b:array[0..200] of longint;
    tt:array[0..200,0..200] of longint;
    g:array[0..200,0..200] of char;
procedure nhap;
var i:longint;
begin
 read(n,w,h);
 for i:=1 to n do
  begin
   read(a[i],b[i]);
  end;
end;
procedure danhdau;
var i,j,k:longint;
begin
 a[n+1]:=a[1]; b[n+1]:=b[1];
 for i:=1 to n do
   if (a[i]=a[i+1]) then
    begin
     for k:=b[i] to b[i+1]-1  do tt[a[i],k]:=1;
     for k:=b[i+1] to b[i]-1  do tt[a[i],k]:=1;
    end;
end;
procedure xuli;
var ok,v,u,i,j:longint;
begin
 for v:=h-1 downto 0 do
  begin
   ok:=0;
   for u:=0 to w-1 do
    begin
     ok:=ok xor tt[u,v];
     if ok=1 then write('#')
     else write('.');
    end;
   writeln;
  end;
end;
begin
 assign(input,'pixel.inp');reset(input);
 assign(output,'pixel.out');rewrite(output);
 nhap;
 danhdau;
 xuli;
 close(input);
 close(output);
end.