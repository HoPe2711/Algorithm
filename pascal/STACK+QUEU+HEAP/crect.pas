{$H+}
uses math;
var m,n,top:longint;    res:int64;
    st:array[0..500] of string;
    h,stack,l:array[0..10000] of longint;
    hcn:array[0..10000] of int64;
procedure nhap;
var i:longint;
begin
 readln(m,n);
 for i:=1 to m do readln(St[i]);
end;
procedure timl;
var i:longint;
begin
 top:=0;
 stack[top]:=0;
 for i:=1 to n do
  begin
   while (top>0) and (h[i]<=h[stack[top]]) do dec(top);
   l[i]:=stack[top]+1;
   inc(top);
   stack[top]:=i;
  end;
end;
function find(x,y,z:longint):int64;
var i,j,point:longint;
begin
 find:=0;
 for i:=1 to n do
  begin
   h[i]:=0;
   hcn[i]:=0;
  end;
 for i:=1 to m do
  begin
   for j:=1 to n do
    begin
     point:=ord(st[i,j])-64;
     if (point=x) or (point=y) or (point=z) then h[j]:=h[j]+1 else h[j]:=0;
    end;
   timl;
   for j:=1 to n do
    if h[j]<>0 then
     begin
      hcn[j]:=hcn[l[j]-1]+h[j]*(j-l[j]+1);
      find:=find+hcn[j];
     end
    else hcn[j]:=0;
  end;
 exit(find);
end;
procedure xuli;
var i,j,k:longint;  tmp:int64;
begin
 for i:=1 to 3 do
  for j:=i+1 to 4 do
   for k:=j+1 to 5 do
    begin
     tmp:=find(i,i,i)+find(j,j,j)+find(k,k,k);
     res:=res+find(i,j,k)+tmp-find(i,i,k)-find(i,j,i)-find(j,j,k);
    end;
 write(res);
end;
begin
 assign(input,'crect.inp');reset(input);
 assign(output,'crect.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
