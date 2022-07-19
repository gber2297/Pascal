{un cine de la ciudad de la plata necesita un programa para
 administrar la informacion de su cartelera. 
 el cine dispone de una estructura donde almacena informacion 
 de las 10 peliculas que tiene en cartelera. 
 de cada pelicula se conoce: 
 titulo, duracion en minutos y categoria a la que pertenece 
 ( 1: drama, 2: comedia, 3: ciencia ficcion, 4: terror)

se debe 

a) leer y almacenar informacion de los espectuadores. 
de cada espectador se lee DNI, apellido y nombre, 
codigo de pelicula (entre 1 y 10). la lectura finaliza cuando
se lee el DNI -1. la informacion debe quedar almacenada en el
 orden que fue leida

b) una vez leida y almacenada toda la informacion, 
calcular e informar
1. la cantidad de espectadores que eligen peliculas de al menos
    90 min de duracion
2. las dos categorias mas elegidas por los espectadores
3. genere una lista con los apellidos y nombres de los espectadores
    con DNI compuestos solo por digitos pares

c)implementar un modulo que elimine de la estructura generada en A, 
    un espectador cuyo DNI se recibe por parametro}

program cine;

const cantPeliculas = 10;
const cantCategorias = 4;
type
    rangoCategoria = 1..cantCategorias;
    rangoCodigo = 1..cantPeliculas;

    vectorPeliculas = array [rangoCodigo] of peliculas;
    vectorCategorias = array [rangoCategoria] of integer;

    peliculas = record
        titulo: string;
        duracion_en_minutos: real;
        categoria:rangoCategoria;
    end;

    espectadores = record
        DNI:integer; 
        apellido_y_nombre: string; 
        codigo_pelicula:rangoCodigo;
    end;

    lista = ^nodo;
    nodo = record
        dato:espectadores;
        sig:lista;
    end;



{a) leer y almacenar informacion de los espectuadores. 
de cada espectador se lee DNI, apellido y nombre, 
codigo de pelicula (entre 1 y 10). la lectura finaliza cuando
se lee el DNI -1. la informacion debe quedar almacenada en el
 orden que fue leida}

procedure leerDatos (e:espectadores);
begin
        read(e.apellido_y_nombre);
        read(e.codigo_pelicula);
    end;
end;

procedure agregarAdelante (var L:lista);
var
    e:espectadores;
    aux:lista;
begin
    new(aux);
    aux^.datos:e;
    aux^.sig:=L;
    L:= aux;  
end;

procedure cargarLista (var L:lista);
    e:espectadores;
begin
        read(e.DNI);
        while (e.DNI <> -1) do begin
            leerDatos(e)
            agregarAdelante(L,e)
            read(e.DNI);
        end; 
        L:= L^.sig;
    end;
end;

procedure inicializarVector(var vec:vectorCategorias);
var
    i:rangoCategoria;
    vec:vectorCategorias;
begin
    for i:= 1 to cantCategorias do
        vec[i] := 0;
end;

{b) una vez leida y almacenada toda la informacion, 
calcular e informar
1. la cantidad de espectadores que eligen peliculas de al menos
    90 min de duracion
2. las dos categorias mas elegidas por los espectadores
3. genere una lista con los apellidos y nombres de los espectadores
    con DNI compuestos solo por digitos pares}

procedure procesarDatos (L:lista;  var L2: lista);
var 
    e:espectadores
    v:vectorPeliculas; 
    vec:vectorCategorias,
    cant:integer;
    actual:lista;

begin
    L:=NIL;
    cant:= 0; 
    inicializarVector(vec);

    while (L <> NIL) do begin
        actual:= L^.dato.codigo_pelicula;
        if (v[i].duracion_en_minutos > 90) then //inciso 1
            cant := cant + 1;
        while (L^.dato.codigo_pelicula = actual) do begin //inciso 2
            vec[i].categoria := vec[i].categoria + 1;
            L:= L^.sig;
        end;
        L:= L^.sig;
    end;
    procesarMaxs(vec, max1, max2); //inciso 2
    ejercicio3(DNIPar,L, L2); //inciso 3
    //inciso 1
    write("la cantidad de espectadores que eligen + 90min es", cant);   
end;

3. {genere una lista con los apellidos y nombres de 
los espectadores
    con DNI compuestos solo por digitos pares}


procedure ejercicio3(L:lista; var L2:lista;)
var
    aux:espectadores;
begin
    L2 := NIL;
    aux:=L^.dato;
    while ( L2 <> NIL) do
        if ((DNIPar = true)) then
            leerDatos(aux.apellido_y_nombre);
            agregarAdelante(L2, aux);
        L2:=L2^.sig;
        end;
    end;
end;

function DNIPar (dni:integer):boolean;
var
    esPar:boolean;
    dig:integer;
begin
    esPar:= false;
    dig:= dni MOD 10;
    while (dig <> 0) do begin
        if ((dig MOD 2) = 0) then
            esPar:=true;
            dig:= dig DIV 10;
        end
        else 
            DNIPar := false
        end
    end;
    DNIPar := esPar;
end;

procedure procesarMaxs(vec:vectorCategorias; var max1, max2);
var
    i: integer
    max1,max2:integer;
begin
    for i:= 1 to cantCategorias do
    begin
        if ( vec[i] > max1 ) then {evalúa maximo 1}
            begin
            max2:=max1;
            max1:= vec[i];
        end
        else 
            if ( vec[i] > max2 ) then begin {evalúa máximo 2}
                max2:= vec[i];
            end;
        end;
            i:= i + 1;
            end;
        end;
    end;
        
end;

program principal;
var


cargarPeliculas()//se dispone
cargarLista(L);
procesarDatos(vec, L2);

end.