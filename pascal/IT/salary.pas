uses math;
var ke,next,head,d,tin:Array[0..200000] of longint;
    dem,n,m:longint;
    rem,val:array[0..1000000] of int64;
    w:Array[0..200000] of int64;

procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
end;
procedure DFS(u:longint);
var j,v:longint;
begin
 j:=head[u];       d[u]:=1;
 inc(dem); tin[u]:=dem;
 while j<>0 do
  begin
   v:=ke[j];
   dfs(v);
   d[u]:=d[v]+d[u];
   j:=next[j];
  end;
end;
procedure nhap;
var i,c:longint;        v:int64;
begin
 readln(n,m);
 readln(w[1]);
 for i:=1 to n-1 do
  begin
   readln(v,c);
   w[i+1]:=v;
   add(i,c,i+1);
  end;
 DFS(1);
end;

procedure trans(s,l,r:longint);
begin
 if (rem[s]=0) or (l=r) then exit;
 val[2*s]:=val[2*s]+rem[s];
 rem[2*s]:=rem[2*s]+rem[s];
 val[2*s+1]:=val[2*s+1]+rem[s];
 rem[2*s+1]:=rem[2*s+1]+rem[s];
 rem[s]:=0;
end;

procedure init(s,l,r,i:longint;x:int64);
var mid:longint;
begin
 if (i>r) or (i<l) then exit;
 if (l=r) then
  begin
   val[s]:=x;
   exit;
  end;
 mid:=(l+r) div 2;
 init(2*s,l,mid,i,x);
 init(2*s+1,mid+1,r,i,x);
 val[s]:=val[2*s]+val[2*s+1];
end;
procedure update(s,l,r,u,v:longint;x:int64);
var mid:longint;
begin
 if (u>r) or (v<l) then exit;
 if (u<=l) and (r<=v) then
  begin
   val[s]:=val[s]+x;
   rem[s]:=rem[s]+x;
   exit;
  end;
 trans(s,l,r);
 mid:=(l+r) div 2;
 update(2*s,l,mid,u,v,x);
 update(2*s+1,mid+1,r,u,v,x);
 val[s]:=val[2*s]+val[2*s+1];
end;
function get(s,l,r,u,v:longint):int64;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(0);
 if (u<=l) and (r<=v) then exit(Val[s]);
 trans(s,l,r);
 mid:=(l+r) div 2;
 exit(get(2*s,l,mid,u,v)+get(2*s+1,mid+1,r,u,v));
end;
procedure xuli;
var i,u,v:longint; x:char;
begin
 for i:=1 to n do init(1,1,n,tin[i],w[i]);
 for i:=1 to m do
  begin
   read(x);
   if x='p' then
    begin
     readln(u,v);
     update(1,1,n,tin[u]+1,tin[u]+d[u]-1,v);
    end
   else
    begin
     readln(u);
     writeln(get(1,1,n,tin[u],tin[u]));
    end;
  end;
end;
begin
 assign(input,'salary.inp');reset(input);
 assign(output,'salary.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
