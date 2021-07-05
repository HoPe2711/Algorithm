var
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=1;
end;
procedure nhap;
var
begin
 read(n,m,d);
 for i:=1 to n do read(x[i],y[i]);
 for i:=1 to m do
  begin
   read(u,v);
   add(i,u,v);
  end;
end;
procedure khoitao;
var i,s,j,u,v:longint;
begin
 for i:=1 to n do d[1,i]:=oo;
 s:=1;
 j:=head[s];
 while j<>0 do
  begin
   v:=ke[j];
   d[s,u]:=ts[j];
   j:=next[j];
  end;
 d[1,1]:=0;
end;
function vector(x1,y1:longint):node;
begin
 vector.xx:=x[y1]-x[x1];
 vector.yy:=y[y1]-y[x1];
end;
function distant(x1,y1:longint):real;
begin
 distant:=sqrt(sqr(x[x1]-x[y1])+sqr(y[x1]-y[y1]));
end;
function check(delta:real):boolean;
var
begin
 cc:=cos(degtorad(delta));
 fillchar(pos,sizeof(pos),0);
 khoitao;
 nheap:=0;
 push(1);
 repeat
  pop;

  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    a:=vector(p,u);
    b:=vector(u,v);
    if cos(a,b)>=cc then
      if d[u,v]>d[p,u]+ts[j] then
       begin
        d[u,v]:=d[p,u]+w;
        if pos[u,v]=0 then push(u,v)
        else upheap(pos[u,v]);
       end;
    j:=next[j];
   end;
 until nheap=0;
end;
procedure xuli;
var l,r,mid,res:real;
begin
  l:=0;
  r:=180;
  while l<=r do
   begin
    mid:=(l+r)/2;
    if check(mid) then
     begin
      res:=mid;
      r:=mid-esp;
     end
    else l:=mid+esp;
   end;
  write(res:0:6);
end;
begin
  assign(input,'ecorace.inp');reset(input);
  assign(output,'ecorace.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
end.