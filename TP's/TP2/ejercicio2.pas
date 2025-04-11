
program ejercicio2;

const
	valorAlto ='9999';

type
	
	prod = record
		cod:string[4];
		nom:string[30];
		precio:real;
		stockact:integer;
		stockmin:integer;
	end;
	
	venta = record
		cod:string[4];
		univend:integer;
	end;
	
	maestro = file of prod;
	
	detalle = file of venta;

//Lectura de maestro

	procedure leerProd (var p:prod);
	begin
		writeln('Ingrese el precio, para salir -1');
		readln(p.precio)
		if (p.precio <> -1) then begin
			writeln('Ingrese el codigo de prod: ');
			readln(e.cod);
			writeln('Ingrese el nombre del prod: ');
			readln(e.nom);
			writeln('Ingrese el stock actual del prod: ');
			readln(e.stockact);
			writeln('Ingrese el stock min del prod: ');
			readln(p.stockmin);
		end;
	end;
	
	procedure cargarMaestro (var m: maestro);
	var
		p:prod;
	begin
		rewrite(m);
		writeln('Ingrese un nuevo producto: ');
		leerProd(p);
		while (p.precio <> -1) do begin
			write(m,p);
			writeln('Ingrese un nuevo producto: ');
			leerProd(p);
		end;
		close(m);
	end;
	
//Lectura de Detalle
	procedure leerVenta (var v:venta);
	begin
		writeln('Ingresa las unidades vendidas, -1 para salir');
		readln(v.univend);
		if (v.univend <> -1) then
			writeln('Ingrese el codigo del prod vendido');
			readln(v.cod);
	end;

	procedure cargarDetalle(var d:detalle);
	var
		v:venta;
	begin
		rewrite(d);
		writeln('Ingrese el nuevo producto vendido: ');
		leerVenta(v);
		while (v.univend <> -1) do begin
			write(d,v);
			writeln('Ingrese el nuevo producto vendido: ');
			leerVenta(v);	
		end;
		close(d);
	end;
	
// Punto A
	
	

	
//Programa principal
var
	m:maestro;
	d:detalle;
BEGIN
	assign(m,'Maestro');
	assign(d,'Detalle');
	cargarMaestro(m);
	cargarDetalle(d);
	
END.

