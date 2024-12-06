CREATE DEFINER = CURRENT_USER TRIGGER `examen_eva3`.`formas_pago_pacientes_BEFORE_DELETE` BEFORE DELETE ON `formas_pago_pacientes` FOR EACH ROW
BEGIN
	delete from cuentas_pacientes where forma_pago_pac_id = old.forma_pago_pac_id ;
END
