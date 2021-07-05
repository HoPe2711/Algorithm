uses math;
var t,h,m,n,top,cnt,ss,dem:longint;
    ke,head,next,a,b,stack,num,low,lab,tin,tout,aa:array[0..100000] of longint;
    free:array[0..100000] of boolean;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
end;
procedure nhap;
var i:longint;
begin
 dem:=0;
 read(n,m);
 for i:=1 to m do
  begin
   read(a[i],b[i]);
   add(i,a[i],b[i]);
  end;
 for i:=1 to m do
 if free[a[i]]=false then
  begin
  inc(dem);
  aa[dem]:=a[i];
  free[a[i]]:=true;
  end;
 for i:=1 to m do
  if free[b[i]]=false then
   begin
    inc(dem);
    aa[dem]:=b[i];
    free[b[i]]:=true;
   end;
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
procedure dfs(u:longint);
var v,j,tt,i:longint;
begin
 push(u);
 inc(cnt);
 num[u]:=cnt;
 low[u]:=cnt;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if lab[v]=0 then
    begin
    if (num[v]=0) then
     begin
      dfs(v);
      low[u]:=min(low[u],low[v]);
     end
    else low[u]:=min(low[u],num[v]);
    end;
   j:=next[j];
  end;
 if low[u]=num[u] then
  begin
   inc(ss);
   repeat
    v:=pop;
    lab[v]:=ss;
   Until v=u;
  end;
end;
procedure xuli;
var i,j,v,l,l1:longint;
begin
 ss:=0;
 l:=0; l1:=0;
 for i:=1 to dem do
  if num[aa[i]]=0 then
   begin
    top:=0;
    cnt:=0;
    dfs(aa[i]);
   end;
 for i:=1 to dem do
  begin
   j:=head[aa[i]];
   while j<>0 do
    begin
     v:=ke[j];
     if (lab[aa[i]]<>lab[v]) then
      begin
       inc(tin[lab[aa[i]]]);
       inc(tout[lab[v]]);
      end;
     j:=next[j];
    end;
  end;
 for i:=1 to ss do
  begin
   if tin[i]=0 then inc(l);
   if tout[i]=0 then inc(l1);
  end;
 if (l=1) and (l1=1) then
  begin
   writeln('YES');
  end
 else writeln('NO');
end;
begin
 assign(input,'sperfect.inp');reset(input);
 assign(output,'sperfect.out');rewrite(output);
 read(t);
 for h:=1 to t do
  begin
   fillchar(tin,sizeof(tin),0);
   fillchar(tout,sizeof(tout),0);
   fillchar(head,sizeof(head),0);
   fillchar(next,sizeof(next),0);
   fillchar(ke,sizeof(ke),0);
   fillchar(lab,sizeof(lab),0);
   fillchar(free,sizeof(free),false);
   fillchar(aa,sizeof(aa),0);
   fillchar(num,sizeof(num),0);
   fillchar(low,sizeof(low),0);
   nhap;
   xuli;
  end;
 close(input); close(output);
end.
