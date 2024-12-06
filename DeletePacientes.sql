CREATE DEFINER=`root`@`localhost` TRIGGER `pacientes_BEFORE_DELETE` BEFORE DELETE ON `pacientes` FOR EACH ROW BEGIN
	delete from cuartos where paciente_id = old.paciente_id;
    delete from direcciones_pacientes where paciente_id = old.paciente_id;
    delete from cuentas_pacientes where paciente_id = old.paciente_id;
    delete from formas_pago_pacientes where paciente_id = old.paciente_id;
	delete from registro_pacientes where paciente_id = old.paciente_id;

END