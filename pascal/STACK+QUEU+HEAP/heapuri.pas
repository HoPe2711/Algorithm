var n,nheap : longint ;
    a,heap,pos : array [1..200000] of longint ;

  procedure doicho( var x,y : longint ) ;
   var tmp : longint ;
    begin
     tmp := x ;
     x := y ;
     y := tmp ;
    end ;

  procedure upheap( i : longint ) ;
   begin
    if (i = 1) or ( a[heap[i]] >= a[heap[i div 2]] ) then exit ;
    doicho(pos[heap[i]] , pos[heap[i div 2]]) ;
    doicho(heap[i] , heap[i div 2]) ;
    upheap(i div 2) ;
   end ;

  procedure downheap( i : longint ) ;
   var j : longint ;
    begin
     j := 2*i ;
     if j > nheap then exit ;
     if ( j < nheap ) and ( a[heap[j]] > a[heap[j+1]] ) then inc(j) ;
     if a[heap[i]] > a[heap[j]] then
      begin
       doicho(pos[heap[i]] , pos[heap[j]]) ;
       doicho(heap[i] , heap[j]) ;
       downheap(j) ;
      end ;
    end ;

  procedure push( i : longint ) ;
   begin
    inc(nheap) ;
    heap[nheap] := i ;
    pos[i] := nheap ;
    upheap(nheap) ;
   end;

  procedure xoa( i : longint ) ;
   begin
    a[i] := 1000000001 ;
    downheap(pos[i]) ;
   end ;

  procedure nhap ;
   var q,i,j,dem : longint ;
    begin
     read(n) ;
     dem := 0 ;
     for i := 1 to n do
      begin
       read(q) ;
       if q = 1 then
        begin
         inc(dem) ;
         read(a[dem]) ;
         push(dem) ;
        end;
       if q = 2 then
        begin
         read(j) ;
         xoa(j) ;
        end;
       if q = 3 then
        if a[heap[1]] < 1000000001 then writeln(a[heap[1]]) ;
      end ;
    end ;

 begin
  assign(input,'heapuri.inp') ; reset(input) ;
  assign(output,'heapuri.out') ; rewrite(output) ;
  nhap ;
  close(input) ; close(output) ;
 end.

