var dem,a,stack,res,b:Array[0..200000] of longint;
    n,top,t,h:longint;
procedure nhap;
var i:longint;
begin
 fillchar(dem,sizeof(Dem),0);
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   inc(Dem[a[i]]);
  end;
 for i:=1 to n do b[i]:=dem[a[i]];
 top:=0; stack[0]:=n+1;
 for i:=n downto 1 do
  begin
   while (Top>0) and (b[i]>=b[stack[top]]) do dec(top);
   if top=0 then res[i]:=-1 else res[i]:=a[stack[top]];
   inc(Top); stack[top]:=i;
  end;
 for i:=1 to n do write(res[i],' ');
 writeln;
end;
begin
 assign(input,'frequency.inp');reset(input);
 assign(output,'frequency.out');rewrite(output);
 read(T);
 for h:=1 to t do nhap;
 close(input); close(output);
end.
