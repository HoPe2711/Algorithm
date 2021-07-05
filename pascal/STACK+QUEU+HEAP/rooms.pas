uses math;
var n,dem,top:longint;
    a,b,gt,tt,pos,stack,phong,truyvet,dau:array[0..200000] of longint;
procedure nhap;
var  i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i],b[i]);
   inc(dem);
   gt[dem]:=a[i];
   tt[dem]:=1;
   pos[dem]:=i;
   inc(dem);
   gt[dem]:=b[i];
   tt[dem]:=0;
   pos[dem]:=i;
  end;
end;
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
  key:= gt[pp];
  key2:=tt[pp];
  Repeat
   While (gt[i] < key) or ((gt[i]=key) and (tt[i]<key2)) Do Inc(i);
   While (key < gt[j]) or ((gt[j]=key) and (tt[j]>key2)) Do Dec(j);
   If i <= j Then
    Begin
     doicho(gt[i],gt[j]);
     doicho(tt[i],tt[j]);
     doicho(pos[i],pos[j]);
     Inc(i);
     Dec(j);
    end;
   Until i>j;
   If l < j Then quicksort(l,j);
   If i < r Then quicksort(i,r);
 end;
procedure push(x:longint);
begin
 inc(top);
 stack[top]:=x;
end;
function pop:longint;
begin
 pop:=stack[top];
 dec(top);
end;
procedure xuli;
var i,res,j:longint;
begin
 res:=2000000;
 quicksort(1,dem);
 for i:=n downto 1 do push(i);
 for i:=1 to dem do
  begin
   if tt[i]=1 then
    begin
     phong[pos[i]]:=pop;
     res:=min(res,top);
     truyvet[pos[i]]:=dau[phong[pos[i]]];
     dau[phong[pos[i]]]:=pos[i];
    end
   else  push(phong[pos[i]]);
  end;
  writeln(n-res);
  for i:=1 to n-res do
   begin
    j:=dau[i];
    while j<>0 do
     begin
      write(j,' ');
      j:=truyvet[j];
     end;
    writeln;
   end;
end;
BEGIN
  assign(input,'rooms.inp');reset(input);
  assign(output,'rooms.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.
