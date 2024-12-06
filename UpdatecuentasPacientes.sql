CREATE DEFINER=`root`@`localhost` TRIGGER `cuentas_pacientes_BEFORE_UPDATE` BEFORE UPDATE ON `cuentas_pacientes` FOR EACH ROW BEGIN
	update cuentas_pacientes_detalles set cuentas_pacientes_id = new.cuentas_pacientes_id
		where cuentas_pacientes_id = old.cuentas_pacientes_id;
	update registro_pacientes set cuentas_pacientes_id = new.cuentas_pacientes_id
		where cuentas_pacientes_id = old.cuentas_pacientes_id;   
	
END