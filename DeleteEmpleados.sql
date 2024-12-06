CREATE DEFINER=`root`@`localhost` TRIGGER `empleados_BEFORE_DELETE` BEFORE DELETE ON `empleados` FOR EACH ROW BEGIN
delete from direcciones_empleados where empleado_id = old.empleados_id;
    delete from registro_pacientes where registro_por_empleado_id = old.empleados_id;
END