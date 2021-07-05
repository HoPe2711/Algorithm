uses math;
var m,n,k,a,b:int64;
    t,h:longint;
procedure nhap;
var g,q:int64;
begin
 read(m,n,k,a,b);
 g:=min(m div a,n div b);
 q:=m+n-g*(a+b);
 if q>=k then writeln(g)
 else
  begin
   q:=k-q;
   g:= g-(q-1) div (a+b)-1;
   writeln(g);
  end;
end;
begin
 assign(input,'activity.inp');reset(input);
 assign(output,'activity.out');rewrite(output);
 read(t);
 for h:=1 to t do nhap;
 close(input); close(output);
end.
