uses math;
var x,y,t:Array[0..200] of longint;
    res:int64;
    n:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 res:=high(int64);
 for i:=1 to n do read(x[i],y[i]);
end;

procedure xuli;
var  i,j,u,v,u1,v1:longint;       tmp:int64;
begin
 tmp:=0;
 for i:=1 to n-1 do
  for j:=i+1 to n do
   begin
    if t[i]=0 then
     begin
      u:=x[i];
      v:=0;
     end
    else
     begin
      u:=0;
      v:=y[i];
     end;
    if t[j]=0 then
     begin
      u1:=x[j];
      v1:=0;
     end
    else
     begin
      u1:=0;
      v1:=y[j];
     end;
    tmp:=max(tmp,int64((u-u1))*(u-u1)+int64((v-v1))*(v-v1));
   end;
  res:=min(Res,tmp);
end;
procedure duyet(i:longint);
var j:longint;
begin
 if i=n+1 then  xuli
 else for j:=0 to 1 do
  begin
   t[i]:=j;
   duyet(i+1);
  end;
end;

begin
 assign(input,'flower.inp');reset(input);
 assign(output,'flower.out');rewrite(output);
 nhap;       {
 if n<=20 then} duyet(1);
 //else xuli1;
 write(res);
 close(input); close(output);
end.
