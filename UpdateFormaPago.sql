CREATE DEFINER=`root`@`localhost` TRIGGER `formas_pago_BEFORE_UPDATE` BEFORE UPDATE ON `formas_pago` FOR EACH ROW BEGIN
	update formas_pago_pacientes set forma_pago_id = new.forma_pago_id 
		where forma_pago_id = old.forma_pago_id;
	
END