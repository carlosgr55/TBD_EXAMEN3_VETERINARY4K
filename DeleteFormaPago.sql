CREATE DEFINER = CURRENT_USER TRIGGER `examen_eva3`.`formas_pago_BEFORE_DELETE` BEFORE DELETE ON `formas_pago` FOR EACH ROW
BEGIN
	delete from formas_pago_pacientes where forma_pago_id = old.forma_pago_id;
END
