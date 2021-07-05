{$H+}
uses math;
var res:int64;
    st:String;
    s,sum:longint;
    a,b,f:Array[0..5,0..10] of longint;
    x:array[0..50] of longint;
procedure nhap;
var i,j:longint;
begin
 readln(S);
 for i:=1 to 5 do
  begin
   readln(st);
   for j:=1 to 10 do
    begin
     a[i,j]:=ord(st[j])-48;
     sum:=sum+a[i,j];
    end;
  end;
 if 50-sum<s then
  begin
   write(0); halt;
  end;
 if s=50 then
 begin
  write(1);
  halt;
 end;
end;

procedure xuli;
var kq,i,j,tmp,dem,u,v:longint;
begin
 dem:=0;
 for i:=1 to 5 do
  for j:=1 to 10 do
   begin
    b[i,j]:=a[i,j];
    if a[i,j]=0 then
     begin
      inc(dem);
      b[i,j]:=a[i,j]+x[dem];
     end;
    f[i,j]:=f[i-1,j]+f[i,j-1]-f[i-1,j-1]+b[i,j];
   end;
 kq:=0;
 for i:=1 to 5 do
  for j:=1 to 10 do
   if b[i,j]=0 then
    for u:=1 to 5 do
     for v:=1 to 10 do
      if b[u,v]=0 then
       begin
        tmp:=f[u,v]-f[i-1,v]-f[u,j-1]+f[i-1,j-1];
        if tmp=0 then kq:=max(kq,(u-i+1)*(v-j+1));
        if kq>s then exit;
       end;
  if kq=s then inc(Res);
end;

procedure duyet(i:longint);
var  j:longint;
begin
 if i=50-sum+1 then xuli
 else
  for j:=0 to 1 do
   begin
    x[i]:=j;
    duyet(i+1);
   end;
end;
begin
 assign(input,'color.inp');reseT(input);
 assign(output,'color.out');rewrite(output);
 nhap;
 duyet(1);
 write(res);
 close(input); close(output);
end.