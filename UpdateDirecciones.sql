CREATE DEFINER=`root`@`localhost` TRIGGER `direcciones_BEFORE_UPDATE` BEFORE UPDATE ON `direcciones` FOR EACH ROW BEGIN
	update direcciones_empleados set direccion_id = new.direccion_id where direccion_id = old.direccion_id;
	update direcciones_pacientes set direccion_id = new.direccion_id where direccion_id = old.direccion_id;

END