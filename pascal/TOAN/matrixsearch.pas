uses math;
var n,m:longint;
    a:array[0..1000,0..1000] of longint;
    add,tru:array[0..1000,0..1000] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n,m);
 for i:=1 to n do
  for j:=1 to m do read(a[i,j]);
end;
procedure xuli;
var q,i,x,cas,u,v,k,t,p,j,tg:longint; ok:boolean;
begin
 read(Q);
 for i:=1 to q do
  begin
   read(cas);
   if cas=2 then
    begin
     read(u,v,x);
     for j:=u to n do tru[j,v-1]:=tru[j,v-1]-x;
     for j:=v to m do add[u,j]:=add[u,j]+x;
    end
   else
    begin
     read(k);
     ok:=false;
     t:=1; p:=m;
     tg:=add[t,p];
     repeat
      if a[t,p]+tg=k then
       begin
        ok:=true;
        break;
       end;
      if  a[t,p]+tg>k then
       begin
        p:=p-1;
        tg:=tg+tru[t,p];
       end
      else
       begin
        t:=t+1;
        tg:=tg+add[t,p];
       end;
     until (t=n+1) or (p=0);
     if ok=true then writeln('Y')
     else writeln('N');
    end;
  end;
end;
begin
 assign(input,'matrixsearch.inp');reset(input);
 assign(output,'matrixsearch.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
