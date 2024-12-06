CREATE DEFINER=`root`@`localhost` TRIGGER `formas_pago_pacientes_BEFORE_UPDATE` BEFORE UPDATE ON `formas_pago_pacientes` FOR EACH ROW BEGIN
	update cuentas_pacientes set forma_pago_pac_id = new.forma_pago_pac_id 
		where forma_pago_pac_id = old.forma_pago_pac_id ;
END