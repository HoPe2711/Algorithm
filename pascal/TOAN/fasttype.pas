{$H+}
var k,m,n:longint;
    a,b,c,pos:Array[0..500000] of longint;
    s,res:String;
procedure nhap;
var i:longint;
begin
 readln(k,m);
 readln(s);
 readln(n);
 for i:=1 to n do read(a[i],b[i],c[i]);
end;
procedure xuli;
var i,j:longint;
begin
 for i:=1 to k do pos[i]:=i;
 for i:=n downto 1 do
  begin
   for j:=1 to k do
    if pos[j]>c[i]+b[i]-a[i] then pos[j]:=pos[j]-(b[i]-a[i])
    else if (pos[j]>c[i]) and (pos[j]<=c[i]+b[i]-a[i]) then pos[j]:=pos[j]+a[i]-c[i];
  end;
 for i:=1 to k do res:=res+s[pos[i]];
 write(reS);
end;
begin
 assign(input,'fasttype.inp');reset(input);
 assign(output,'fasttype.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(outpuT);
end.
