{$H+}
uses math;
const oo=1000000;
var x,y,z,res,n,l:longint;
    st:string;
    dd:array[0..101,0..101,0..2,0..2] of boolean;
    f:array[0..101,0..101,0..2,0..2] of longint;
    pos1:array[0..101,0..101] of longint;
    a,s,vet:array[0..1000] of longint;
procedure nhap;
var i:longint;
begin
 res:=oo;
 readln(x,y,z);
 readln(st);
 n:=length(st);
 for i:=1 to n do
  if st[i]='A' then a[i]:=1
  else a[i]:=2;
end;
function pos2(x:char;s:string):longint;
var i,dem:longint;
begin
 dem:=0;
 for i:=1 to length(s) do
  if s[i]=x then inc(dem);
  exit(dem);
end;
function tinh1(m:longint;s:string):longint;
var i:longint;     s2:string;
begin
 if (pos2('A',s)+pos2('B',s))=0 then
  begin
   writeln(m,' ',0);
   for i:=1 to m do write(vet[i],' ');
   halt;
  end;
 for i:=1 to length(s) do
  if s[i]='A' then
   begin
    s2:=s;
    vet[m+1]:=i;
    s2[i]:='#';
    if i>1 then
    begin
     if s2[i-1]='A' then s2[i-1]:='B'
     else
     if s2[i-1]='B' then s2[i-1]:='A';
    end;
    if i<length(s) then
    begin
     if s2[i+1]='A' then s2[i+1]:='B'
     else
     if s2[i+1]='B' then s2[i+1]:='A';
    end;
    tinh1(m+1,s2);
   end;
end;
procedure sub3;
begin
 if pos2('A',st) mod 2=0 then
  begin
   write(-1);
   halt;
  end;
  tinh1(0,st);
  write(-1);
  halt;
end;
function pos(x,t,k:longint):longint;
var i,dem:longint;
begin
 dem:=0;
 for i:=t to k do
  if s[i]=x then inc(dem);
 exit(dem);
end;
function tinh(i,j,c1,c2:longint):longint;
var best,k,cp,t,tg,tg1,dau,cuoi:longint;
begin
 if (dd[i,j,c1,c2]) then exit(f[i,j,c1,c2]);
 dd[i,j,c1,c2]:=true;
 if (i>j) then exit(0);
 for t:=i to j do s[t]:=a[t];
 s[i]:=c1;
 s[j]:=c2;
 if (pos(2,i,j)>0) and (pos(1,i,j)=0) then exit(oo);
 if (pos(2,i,j)+pos(1,i,j)=0) then exit(0);
 best:=oo;
 for k:=i to j do
  if s[k]=1 then
   begin
    cp:=0;
    s[k]:=0;
      if s[k-1]=1 then
       begin
        cp:=cp+x;
        s[k-1]:=2;
        cuoi:=2;
       end
      else if s[k-1]=2 then
       begin
        cp:=cp+y;
        s[k-1]:=1;
        cuoi:=1;
       end
      else if (i>1) then cp:=cp+z;
      if s[k+1]=1 then
       begin
        cp:=cp+x;
        s[k+1]:=2;
        dau:=2;
       end
      else if s[k+1]=2 then
       begin
        cp:=cp+y;
        s[k+1]:=1;
        dau:=1;
       end
      else if  (j<n) then cp:=cp+z;
    tg:=0; tg1:=0;
    if k-1=i then tg:=tinh(i,k-1,cuoi,cuoi);
    if k-1>i then tg:=tinh(i,k-1,s[i],cuoi);
    if k+1=j then tg1:=tinh(k+1,j,dau,dau);
    if k+1<j then tg1:=tinh(k+1,j,dau,s[j]);
    if best>cp+tg+tg1 then
     begin
      best:=cp+tg+tg1;
      pos1[i,j]:=k;
     end;
   end;
  f[i,j,c1,c2]:=best;
  exit(best);
end;
procedure trace(i,j:longint);
begin
 if i>j then exit;
 if i=j then write(i,' ') else write(pos1[i,j],' ');
 trace(i,pos1[i,j]-1);
 trace(pos1[i,j]+1,j);
end;
BEGIN
  assign(input,'ABGAME3.inp');reset(input);
  assign(output,'ABGAME3.out');rewrite(output);
  nhap;
  if n<=100 then
  begin
  write(n,' ');
  res:=tinh(1,n,a[1],a[n]);
  if res=oo then
   begin
    writeln(-1);
    halt;
   end
  else
  begin
   writeln(res);
   trace(1,n);
  end;
  end
  else if (n<=1000) and (x=0) and (y=0) and (z=0) then
    begin
     sub3;
    end;
  close(input);close(output);
END.
