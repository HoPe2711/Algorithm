{$H+}
uses math;
var k,x,y,tt,f,r,kq:int64;
    st,queu,d,trace,t,x1:array[0..10000000] of int64;
procedure nhap;
begin
 read(k,x,y);
 tt:=10**k;
end;
procedure push(x:longint);
begin
 inc(r);
 queu[r]:=x;
end;
function pop:longint;
begin
 pop:=queu[f];
 inc(f);
end;
function check(u:longint):longint;
var dem,res,k:longint;
    i:longint;
begin
 res:=0;
 k:=u;
 dem:=0;
 while k<>0 do
  begin
   inc(dem);
   st[dem]:=k mod 10;
   k:=k div 10;
  end;
 for i:=1 to dem-1 do res:=res+st[i]*10**(i);
 exit(res+st[dem]);
end;
procedure bfs(s:longint);
var u,lt:longint;
begin
 push(s);
 while f<=r do
  begin
   u:=pop;
   if u=y then exit;
   if u<tt then
    if d[u+1]=0 then
     begin
      d[u+1]:=d[u]+1;
      trace[u+1]:=u;
      push(u+1);
     end;
   lt:=check(u);
   if d[lt]=0 then
    begin
     d[lt]:=d[u]+1;
     trace[lt]:=u;
     push(lt);
    end;
  end;
end;
procedure truyvet(u:longint);
begin
 if u=x then exit;
 inc(kq);
 t[kq]:=trace[u];
 truyvet(trace[u]);
end;
procedure xuli;
var i:longint;
begin
 f:=1;
 r:=0;
 bfs(x);
 writeln(d[y]);
 truyvet(y);
 for i:=kq downto 1 do writeln(t[i]);
 writeln(y);
end;
function getbit(x,i:int64):longint;
begin
 exit(1 and (x shr i));
end;
function check1(sum:int64):int64;
var st:string;
    res,x:int64;
    y:longint;
begin
 st:='';
 res:=0;
 str(sum,st);
 res:=res+ord(st[1])-48;
 delete(st,1,1);
 val(st,x,y);
 res:=res+x*10;
 exit(res);
end;
procedure xuli2(res:longint;kk:int64);
var i:longint;
begin
 writeln(res);
 writeln(x);
 for i:=1 to res do
 if getbit(kk,i)=1 then
  begin
   x:=check1(x);
   writeln(x);
  end
 else
  begin
   inc(x);
   writeln(x);
  end;
end;
procedure duyet(i,sum,trt:int64);
begin
 if sum=y then
  begin
   xuli2(i-1,trt);
   halt;
  end;
 if i=21 then exit;
 if sum<tt then duyet(i+1,sum+1,trt);
 duyet(i+1,check1(Sum),trt+1 shl i);
end;

BEGIN
  assign(input,'Cxy.inp');reset(input);
  assign(output,'Cxy.out');rewrite(output);
  nhap;
  if k<=6 then xuli
  else duyet(1,x,1);
  close(input);close(output);
END.
{procedure inkq;
var sum:int64;
    i,res:longint;
begin
 res:=0;
 sum:=x;
 for i:=1 to 20 do
 begin
  inc(res);
  if x1[i]=0 then
   if sum<tt then
    begin
     sum:=sum+1;
     trace[res]:=sum;
    end
   else exit;
  if x1[i]=1 then
   begin
    sum:=check1(sum);
    trace[res]:=sum;
   end;
  if sum=y then break;
 end;
 if sum=y then
    begin
     xuli2(res);
     halt;
    end;
end;
procedure duyet(i:longint);
var j:longint;
begin
 if i=21 then inkq
 else
  for j:=0 to 1 do
   begin
    x1[i]:=j;
    duyet(i+1);
   end;
end;    }
