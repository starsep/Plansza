let modulo = 1000000103;;
let max = 8005;;
let w = Array.make_matrix max max 0;;
let l = Array.make_matrix max max 0;;
let g = Array.make_matrix max max 0;;
let u = Array.make_matrix max max 0;;
let valid x = x>=0;;
let policz x y k =
	if x+y=0 then ()
	else
	begin
		if valid (x-1) then
		begin
			g.(x).(y) <- (g.(x-1).(y) + w.(x-1).(y)) mod modulo;
			if valid (x-k-1) then
			begin
				g.(x).(y) <- (g.(x).(y) - w.(x-k-1).(y) + modulo) mod modulo;
			end;
		end;
		if valid (y-1) then
		begin
			l.(x).(y) <- (l.(x).(y-1) + w.(x).(y-1)) mod modulo;
			if valid(y-k-1) then
			begin
				l.(x).(y) <- (l.(x).(y) - w.(x).(y-k-1) + modulo) mod modulo;
			end;
		end;
		if valid (x-1) && valid (y-1) then
		begin
			u.(x).(y) <- (u.(x-1).(y-1) + w.(x-1).(y-1)) mod modulo;
			if valid (x-k-1) && valid (y-k-1) then
			begin
				u.(x).(y) <- (u.(x).(y) - w.(x-k-1).(y-k-1) + modulo) mod modulo;
			end;
		end;
		w.(x).(y) <- (l.(x).(y) + g.(x).(y) + u.(x).(y)) mod modulo
	end;();;
let solve n m k =
	w.(0).(0) <- 1;
	l.(0).(0) <- 0;
	g.(0).(0) <- 0;
	u.(0).(0) <- 0;
	for i=0 to n-1 do
		for j=0 to m-1 do
			policz i j k
		done;
	done;
	w.(n-1).(m-1)
;;
let main _ =
	let t = Scanf.scanf "%d\n" (fun x -> x) in
	for i=0 to t-1 do
		let (n, m, k) = Scanf.scanf "%d %d %d\n" (fun x y z -> (x, y, z)) in
		Printf.printf "%d\n" (solve n m k)
	done;
	;;
main();;  