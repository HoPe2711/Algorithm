uses math;
const q1:array[1..4] of longint=(1,-1,0,0);
      q2:array[1..4] of longint=(0,0,-1,1);
      oo=10000000;
var n,x,y,z,f,r,x1,y1,tt,tt1,t,h,res,maxx,maxy:longint;
    queu,queu1,queu2,a,b,c,d1,pos:array[0..16000000] of longint;
    dd:array[-1..2004,-1..2004] of longint;
    d:array[-1..2004,-1..2004,1..4] of longint;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure Quicksort ( l,r:longint);
 Var i, j, key,key2,pp: longint;
 Begin
  i:= l;
  j:= r;
  pp:=l+random(r-l+1);
  key:= a[pp];
  key2:=b[pp];
  Repeat
   While (a[i] < key) or ((a[i]=key) and (b[i]<key2)) Do Inc(i);
   While (key < a[j]) or ((a[j]=key) and (b[j]>key2)) Do Dec(j);
   If i <= j Then
    Begin
     doicho(a[i],a[j]);
     doicho(b[i],b[j]);
     doicho(pos[i],pos[j]);
     Inc(i);
     Dec(j);
    end;
   Until i>j;
   If l < j Then quicksort(l,j);
   If i < r Then quicksort(i,r);
 end;
procedure Quicksort1 ( l,r:longint);
 Var i, j, key,key2,pp: longint;
 Begin
  i:= l;
  j:= r;
  pp:=l+random(r-l+1);
  key:= b[pp];
  key2:=c[pp];
  Repeat
   While (b[i] < key) or ((b[i]=key) and (c[i]<key2)) Do Inc(i);
   While (key < b[j]) or ((b[j]=key) and (c[j]>key2)) Do Dec(j);
   If i <= j Then
    Begin
     doicho(c[i],c[j]);
     doicho(b[i],b[j]);
     doicho(pos[i],pos[j]);
     Inc(i);
     Dec(j);
    end;
   Until i>j;
   If l < j Then quicksort1(l,j);
   If i < r Then quicksort1(i,r);
 end;
procedure nhap;
var i,o,o1:longint;
begin
 fillchar(dd,sizeof(dd),0);
 read(tt,tt1,x1,y1);
 read(n);
 a[0]:=tt; b[0]:=tt1; a[n+1]:=x1; b[n+1]:=y1;
 pos[0]:=0;
 pos[n+1]:=n+1;
 for i:=1 to n do
  begin
   read(a[i],b[i]);
   pos[i]:=i;
  end;
end;
procedure back(i,j,k:longint);
begin
 dec(f);
 queu[f]:=i;
 queu1[f]:=j;
 queu2[f]:=k;
end;
procedure push(i,j,k:longint);
begin
 inc(r);
 queu[r]:=i;
 queu1[r]:=j;
 queu2[r]:=k;
end;
procedure pop;
begin
 x:=queu[f];
 y:=queu1[f];
 z:=queu2[f];
 inc(f);
end;
procedure BFS;
var i,u,v,j:longint;
begin
for j:=1 to 4 do
 begin
 fillchar(d,sizeof(d),0);
 f:=1; r:=0;
 push(tt,tt1,j);
 d[tt,tt1,j]:=1;
 while f<=r do
  begin
   pop;
   if (x=x1) and (y=y1) then
     begin
      res:=min(res,d[x,y,z]);
      break;
     end;
   for i:=1 to 4 do
    begin
     u:=x+q1[i];
     v:=y+q2[i];
     if (u>=-1) and (v>=-1) and (u<=maxx+1) and (v<=maxy+1) then
     begin
     if (z=i) and (dd[u,v]=0)  and  (d[u,v,i]=0) then
      begin
       d[u,v,i]:=d[x,y,z];
       back(u,v,i);
      end;
     if (z<>i) and (dd[u,v]=0) and  (d[u,v,i]=0) then
      begin
       d[u,v,i]:=d[x,y,z]+1;
       push(u,v,i);
      end;
     end;
    end;
  end;
 end;
end;
procedure xuli;
begin
 res:=oo;
 BFS;
 if res=oo then writeln(-1)
 else writeln(res);
end;
procedure rr;
var i:longint;
begin
 maxx:=-oo;
 maxy:=-oo;
 quicksort(0,n+1);
 c[0]:=0;
 for i:=0 to n do
  if a[i+1]-a[i]>2 then c[i+1]:=c[i]+2
  else c[i+1]:=c[i]+(a[i+1]-a[i]);
 quicksort1(0,n+1);
 d1[0]:=0;
  for i:=0 to n do
  if b[i+1]-b[i]>2 then d1[i+1]:=d1[i]+2
  else d1[i+1]:=d1[i]+(b[i+1]-b[i]);
 for i:=0 to n+1 do
 if (pos[i]<>0) and (pos[i]<>n+1) then
  begin
   maxx:=max(maxx,c[i]);
   maxy:=max(maxy,d1[i]);
   dd[c[i],d1[i]]:=1;
  end
 else if pos[i]=0 then
  begin
   tt:=c[i];
   tt1:=d1[i];
   dd[tt,tt1]:=1;
  end
 else
  begin
   x1:=c[i];
   y1:=d1[i];
  end;
  maxx:=max(max(tt,x1),maxx);
  maxy:=max(max(tt1,y1),maxy);
end;
begin
 assign(input,'rook.inp');reset(input);
 assign(output,'rook.out');rewrite(output);
 read(t);
 for h:=1 to t do
  begin
   nhap;
   rr;
   xuli;
  end;
 close(input);
 close(output);
end.
