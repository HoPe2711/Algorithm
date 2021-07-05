uses math;
const oo=1000000000;
var n,dot,f,r:longint;
    d,queu:Array[0..40000000] of longint;
procedure nhap;
var i,x:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(x);
   if x=1 then  dot:=dot+2**(i-1);
  end;
end;


function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
function batbit(i,x:longint):longint;
begin
 exit(x or (1 shl i));
end;
function tatbit(i,x:longint):longint;
begin
 exit(x and (not (1 shl i)));
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

procedure BFS(x:longint);
var i,j,u,k,last:longint;
begin
 f:=1; r:=0;
 for i:=0 to 2**n-1 do d[i]:=oo;
 d[dot]:=0;
 push(dot);
 while f<=r do
  begin
   u:=pop;
   for i:=1 to n do
   if getbit(i-1,u)=0 then
    begin
     k:=batbit(i-1,u);
     last:=0;
     for j:=1 to n do
      if getbit(j-1,k)=1 then inc(last)
      else
       begin
        if last>=4 then
          while last>0 do
           begin
            k:=tatbit(j-last-1,k);
            dec(last);
           end;
        last:=0;
       end;
     if last>=4 then
      while last>0 do
       begin
        k:=tatbit(n-last,k);
        dec(last);
       end;
     if d[k]>d[u]+1 then
      begin
       d[k]:=d[u]+1;
       push(k);
      end;
    end;
  end;
end;
procedure xuli;
begin
 BFS(dot);
 write(d[0]);
end;
begin
 assign(input,'switch.inp');reset(input);
 assign(output,'switch.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
