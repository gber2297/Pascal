program libreria;

const cantLibros = 5000;
const cantMaterias = 7;

type 
    rangoLibros = 1..cantLibros;
    rangoMaterias = 1..cantMaterias;
    nombre = string[20];
    meses = 1..12;

    //vectorLibros = array [rangoLibros] of integer;
    vectorMaterias = array [rangoMaterias] of integer;

    libros = record
        codigoL: rangoLibros;
        codigoM: rangoMaterias;
        titulo:nombre;
        anoEdicion: integer;
        precio:real;
        autor:nombre;
    end;

    ventas = record
        codigoL:rangoLibros;
        dni:integer;
        mes:meses;
        anoVenta:integer; 
    end;

    lista = ^nodo;
    nodo = record
        datos:libros;
        sig:lista;
    end;





var 

L:lista;
v: listaventas;

procedure leerDatos(var lib:libros);
begin
    read(lib.codigoL);
    read(lib.codigoM);
    read(lib.titulo);
    read(lib.anoEdicion);
    read(lib.precio);
    read(lib.autor);
end;

procedure agregarAdelante (var L: lista; lib:libros);
var
    aux: lista;
begin
    new(aux);
    aux^.datos:=lib;
    aux^.sig:= L;
    L := aux;
end;

procedure cargarLista (var L:lista);
var 
    lib:libros; i:integer;
begin
    for i:= 1 to cantLibros do begin 
            leerDatos(lib);
            agregarAdelante(L,lib);
        end;
end;

procedure inicializarVector (vec: vectorMaterias);
var
    i: rangoMaterias;
begin
    for i:= 1 to cantMaterias do begin
        vec[i]:= 0;
    end;
end;
function sin_dig_par(v: listaventas):boolean;
    var
        dig: integer;
        tiene_Par:boolean;

    begin
        tiene_Par:= false;
        while (tiene_Par:= false) do
        begin
            dig:= v^.dato.dni mod 10;
            if ((dig mod 2) = 0) then
                tiene_Par:=true;
            else v^.dato.dni:= v^.dato.dni div 10;
        end;
        if (tiene_Par = false) then
        sin_dig_par:= true;
        else (tiene_Par = true)
        sin_dig_par:= false;
    end;

procedure ejercicio_b(v:listaventas; L: lista);
    var

    begin
        if (sin_dig_par) AND ((l^.dato.añoEdicion > 2011) AND (l^.dato.añoEdicion < 2017)) then
        begin
            write(v^.dato.añoVenta);
            write(l^.dato.titulo);
        end;
    end;

procedure procesarVentas(L:lista; VAR vec:vectorMaterias);
var
    actual:lista;
    max1, max2: integer;
begin
    L:=NIL;
    inicializarVector(vec);
    while (L <> NIL) do begin
        actual:= L^.codigoM;
        while (L^.codigoM = actual) do begin
        vec[L^.codigoM]:= vec[L^.codigoM] + 1;
        L:=L^.sig;
        end;
        L:=L^.sig;  
    end;
    ejercicio_b(v, L);
    procesarMaximos(vec, max1 ,max2);
    writeln(max1);
    writeln(max2);
end;

procedure procesarMaximos(vec:vectorMaterias; var max1, max2: integer):
    var 
        i, materia: integer;
    begin
        max1:= -1;
        max2:= -1;
        for i:=1 to cantMaterias do
        begin
            if (vec[i] > max1) then
            begin
                materia:= i;
                max1:= materia;
                max2:= max1;
            end;
        end;

    end;

BEGIN
    cargarLista(l);
    procesarVentas(l, vec);

END.