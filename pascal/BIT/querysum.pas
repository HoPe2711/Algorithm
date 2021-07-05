uses math;
var n,q:longint;
    t,a:Array[0..500000] of int64;
procedure update(i:longint;x:int64);
begin
 while i<=n do
  begin
   t[i]:=t[i]+x;
   i:=i+i and (-i);
  end;
end;
function get(i:longint):int64;
begin
 get:=0;
 while i>0 do
  begin
   get:=get+t[i];
   i:=i-i and (-i);
  end;
end;
procedure nhap;
var  i,u,v:longint; x:char;
begin
 readln(n,q);
 for i:=1 to q do
  begin
   read(x);
   if x='S' then
    begin
     readln(u,v);
     update(u,v-a[u]);
     a[u]:=v;
    end
   else
    begin
     readln(u,v);
     writeln(get(v)-get(u-1));
    end;
  end;
end;
begin
 assign(input,'querysum.inp');reset(input);
 assign(output,'querysum.out');rewrite(output);
 nhap;
 close(input); close(output);
end.