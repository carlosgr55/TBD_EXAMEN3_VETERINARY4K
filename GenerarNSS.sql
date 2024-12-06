delimiter $$
create function generar_nss(fecha_nac date)
returns varchar(15) not deterministic reads sql data
begin
    declare nss varchar(12);
	declare consecutivoR int;
	declare ano varchar(2);
    declare anoRan int;
    declare anoNum int;
    declare anoNac varchar(2);
    declare anoNacNum int;
	declare oficina varchar(2);
    declare oficinaNum int;
    declare verificador int;
    set oficinaNum = FLOOR(RAND()*(99-1+1)+1);
    
    if oficinaNum < 10 then 
		set oficina = concat('0', oficinaNum);
    else	
		set oficina = concat(oficinaNum);
	end if;
	
    set anoNum = CAST(SUBSTRING(fecha_nac, 1,4) AS DECIMAL(4,0));
    set anoNacNum = CAST(SUBSTRING(fecha_nac, 3,2) AS DECIMAL(2,0));
    set anoNum = anoNum + 15;
    set anoRan = FLOOR(RAND()*(2024-anoNum+1)+anoNum);
	set anoRan = cast(substring(concat(anoRan,''),3,2) as decimal(2,0));
    if anoRan < 10 then
		set ano = concat('0', anoRan);
	else
		set ano = concat(anoRan,'');
	end if;
    
    if anoNacNum < 10 then
		set anoNac = concat('0', anoNacNum);
	else
		set anoNac = concat(anoNacNum, '');
	end if;
	
    select consecutivo into consecutivoR from consecutivos order by consecutivo desc limit 1;
    set consecutivoR = consecutivoR +1;
    
    set nss = concat(oficina, ano, anoNac, consecutivoR);
    set verificador = digito_verificador(nss);
    set nss = concat(nss, verificador);
    if length(nss) > 11 then
		set nss = substring(nss, 1,11);
    end if;
	insert into consecutivos value (consecutivoR);
    
    return nss;
end$$
delimiter ;