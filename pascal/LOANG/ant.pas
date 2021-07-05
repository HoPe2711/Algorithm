const q1:array[1..4] of longint=(1,0,-1,0);
      q2:array[1..4] of longint=(0,1,0,-1);
var  free:array[-1000..1000,-1000..1000] of boolean;
      c,s,sb,f,r,res,x,y:longint;
      a:array[-1000..1000,-1000..1000] of longint;
      queu,queu1:array[0..10000000] of longint;
procedure nhap;
var i,u,v:longint;
begin
 read(c,s);
 for i:=1 to c do
  begin
   read(u,v);
   a[u,v]:=1;
  end;
end;
procedure push(i,j:longint);
begin
 inc(r);
 queu[r]:=i;
 queu1[r]:=j;
end;
procedure pop;
begin
 x:=queu[f];
 y:=queu1[f];
 inc(f);
end;
procedure BFS(s,s1:longint);
var u,v,i:longint;
begin
 f:=1;
 r:=0;
 push(s,s1);
 while f<=r do
  begin
   pop;
   free[x,y]:=false;
   for i:=1 to 4 do
    begin
     if sb<=s then
      begin
       if (a[x+q1[i],y+q2[i]]=0) and (free[x+q1[i],y+q2[i]]) then
        begin
         inc(res);       inc(sb);
         free[x+q1[i],y+q2[i]]:=false;
         push(x+q1[i],y+q2[i]);
        end;
      end
     else
      begin
       sb:=0;
       continue;
      end;
     end;
  end;
end;
procedure xuli;
begin
 sb:=0;
 fillchar(free,sizeof(free),true);
 f:=1;
 r:=0;
 res:=1;
 BFS(0,0);
 write(res);
end;
begin
 assign(input,'ant.inp');reset(input);
 assign(output,'ant.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
