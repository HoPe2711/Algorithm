uses math;


type node= record
       x,y,tt: longint;
       end;


const k: array[1..4] of longint = (1,-1,1,-1);
      c: array[1..4] of longint = (-1,-1,1,1);
      oo=1000000000;


var m,n,p,q,s,t,f,r,res: longint;
    a: array[0..201,0..201] of longint;
    que: array[-100000..100000] of node;
    d: array[0..201,0..201,1..4] of longint;


procedure nhap;
  var i,u,v: longint;
  begin
    read(n,m,p,q,s,t);
    for i:=1 to m do
      begin
        read(u,v);
        a[u,v]:=1;
      end;
    res:=oo;
  end;


procedure pushc(a,b,z: longint);
  begin
    dec(f);
    que[f].x:=a;
    que[f].y:=b;
    que[f].tt:=z;
  end;

procedure pushd(a,b,z: longint);
  begin
     inc(r);
    que[r].x:=a;
    que[r].y:=b;
    que[r].tt:=z;
  end;


function pop: node;
  begin
    pop:=que[f];
    inc(f);
  end;


procedure bfs;
  var j,i: longint;
      u: node;
  begin

    for j:=1 to 4 do
      begin
        fillchar(d,sizeof(d),0);
        f:=1;  r:=0;
        pushd(p,q,j);
        d[p,q,j]:=1;
        while f<=r do
          begin
            u:=pop;
            with u do
              begin
                if (x=s) and (y=t) then
                  begin
                    res:=min(res,d[x,y,tt]);
                    break;
                  end;
                for i:=1 to 4 do
                  if (x+k[i]>=1) and (x+k[i]<=n) and (y+c[i]>=1) and (y+c[i]<=n)
                    and (d[x+k[i],y+c[i],i]=0) and (a[x+k[i],y+c[i]]=0) then
                      begin
                        if tt<>i then
                          begin
                            d[x+k[i],y+c[i],i]:=d[x,y,tt]+1;
                            pushd(x+k[i],y+c[i],i);
                          end
                        else
                          begin
                            d[x+k[i],y+c[i],i]:=d[x,y,tt];
                            pushc(x+k[i],y+c[i],i);
                          end;
                      end;
              end;
          end;
      end;
  end;


procedure xuly;
  begin
    bfs;
    if res=oo then write(-1)
      else write(res);
  end;


begin
  //assign(input,'qbbishop.inp'); reset(input);
  //assign(output,'qbbishop.out'); rewrite(output);
  nhap;
  xuly;
  //close(input); close(output);
end.
