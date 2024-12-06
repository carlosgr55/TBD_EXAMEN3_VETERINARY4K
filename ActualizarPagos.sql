delimiter $$
create procedure actualizar_pagos(in id int )
begin
	select e.forma_pago as tipo_pago, sum(ifnull(c.costo_total, 0)) as monto from pacientes a inner join
	cuentas_pacientes b on a.paciente_id = b.paciente_id
    inner join cuentas_pacientes_detalles c on b.cuentas_pacientes_id = c.cuentas_pacientes_id
    inner join formas_pago_pacientes d on b.forma_pago_pac_id = d.forma_pago_pac_id
    inner join formas_pago e on e.forma_pago_id = d.forma_pago_id
    where a.paciente_id = id
    group by e.forma_pago_id;
    
end$$
delimiter ;