CREATE DEFINER=`root`@`localhost` TRIGGER `empleados_BEFORE_UPDATE` BEFORE UPDATE ON `empleados` FOR EACH ROW BEGIN
	update direcciones_empleados set empleado_id = new.empleados_id where empleado_id = old.empleados_id;
    update registro_pacientes set registro_por_empleado_id = new.empleados_id
		where registro_por_empleado_id = old.empleados_id;
END