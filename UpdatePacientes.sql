CREATE DEFINER=`root`@`localhost` TRIGGER `pacientes_BEFORE_UPDATE` BEFORE UPDATE ON `pacientes` FOR EACH ROW BEGIN
	update direcciones_pacientes set paciente_id = new.paciente_id where paciente_id = old.paciente_id;
	update cuartos set paciente_id = new.paciente_id where paciente_id = old.paciente_id;
	update formas_pago_pacientes set paciente_id = new.paciente_id where paciente_id = old.paciente_id;
	update cuentas_pacientes set paciente_id = new.paciente_id where paciente_id = old.paciente_id;
	update registro_pacientes set paciente_id = new.paciente_id where paciente_id = old.paciente_id;

END