uses math;
var  a:array[0..200000] of longint;
     n,res,q,res1:longint;
     d,free:Array[0..31] of longint;
     c:array[0..30,0..30] of longint;
function getbit(i:longint;x:longint):longint;
begin
 exit(1 and (x shr i));
end;
procedure nhap;
var i,last,j:longint;
begin
 readln(n);
 for i:=1 to n do
  begin
   read(a[i]);
   if a[i]=0 then inc(res1);
   last:=-1;
   for j:=0 to 30 do
    if getbit(j,a[i])=1 then
      begin
       inc(d[j]);
       if last<>-1 then
        begin
         inc(c[j,last]);
         inc(C[last,j]);
        end;
       last:=j;
      end;
  end;
 readln;
end;
procedure DFS(u:longint);
var i:longint;
begin
 free[u]:=1;
 for i:=0 to 30 do
 if free[i]=0 then
  if (c[u,i]<>0) and (C[i,u]<>0) then DFS(i);
end;
procedure xuli;
var  ch:char; x,i,j,last,last1,y:longint;
begin
 readln(Q);
 for i:=1 to q do
  begin
   read(ch);
   if ch='?' then
    begin
     res:=0;
     fillchar(free,sizeof(free),0);
     for j:=0 to 30 do
      if (free[j]=0) and (d[j]<>0) then
       begin
        inc(res);
        DFS(j);
       end;
     writeln(ReS+res1);
    end
   else
    begin
     read(x,y); last:=-1; last1:=-1;
     for j:=0 to 30 do
      begin

       if getbit(j,a[x])=1 then
        begin
         dec(D[j]);
         if last<>-1 then
          begin
           dec(c[j,last]);
           dec(C[last,j]);
          end;
         last:=j;
        end;

       if getbit(j,y)=1 then
        begin
         inc(d[j]);
         if last1<>-1 then
          begin
           inc(c[j,last1]);
           inc(C[last1,j]);
          end;
         last1:=j;
        end;

       end;
      if a[x]=0 then dec(res1);
      if y=0 then inc(Res1);
      a[x]:=y;
    end;
   readln;
  end;
end;
begin
 assign(input,'and.inp');reset(input);
 assign(output,'and.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
