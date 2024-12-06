CREATE DEFINER=`root`@`localhost` TRIGGER `direcciones_BEFORE_DELETE` BEFORE DELETE ON `direcciones` FOR EACH ROW BEGIN
delete from direcciones_empleados  where direccion_id = old.direccion_id;
	delete from direcciones_pacientes where direccion_id = old.direccion_id;
END