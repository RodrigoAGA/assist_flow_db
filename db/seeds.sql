-- db/seeds.sql

-- 1. Insertar COMPAÑÍAS (companies)
INSERT INTO companies (id, name, base_hours, lunch_start, lunch_end)
VALUES
(1, 'Tech Solutions Global', 8, '13:00:00', '14:00:00'),
(2, 'Innovación Digital SAC', 7, '12:30:00', '13:30:00');

-- 2. Insertar PERFILES (profiles) - Se asume que la contraseña se manejará en el código de Ruby.
-- Perfil Admin para la Empresa 1
INSERT INTO profiles (id, user_role, email, company_id)
VALUES
(1, 'admin', 'admin.tech@company.com', 1);

-- Perfil Empleado para la Empresa 1
INSERT INTO profiles (id, user_role, email, company_id)
VALUES
(2, 'employee', 'juan.perez@company.com', 1),
(3, 'employee', 'maria.lopez@company.com', 1);

-- Perfil Empleado para la Empresa 2
INSERT INTO profiles (id, user_role, email, company_id)
VALUES
(4, 'employee', 'carlos.sanchez@digital.com', 2);


-- 3. Insertar EMPLEADOS (employees)
-- Nota: La columna profile_id es UNIQUE y se enlaza al perfil de login
INSERT INTO employees (id, dni, full_name, profile_id, company_id)
VALUES
(100, '40001111', 'Juan Pérez (Admin)', 1, 1),
(101, '40002222', 'María López', 3, 1),
(200, '50003333', 'Carlos Sánchez', 4, 2);

-- 4. Insertar GEOFENCES (geofences) para la Empresa 1
INSERT INTO geofences (id, company_id, name, latitude, longitude, radius)
VALUES
(1, 1, 'Oficina Principal', -12.0833, -77.0333, 50),
(2, 2, 'Sede Miraflores', -12.1221, -77.0298, 75);

-- 5. Insertar REGISTROS DE ASISTENCIA (attendance_records) para Juan Pérez (100)
INSERT INTO attendance_records (employee_id, record_time, record_type, latitude, longitude)
VALUES
(100, '2025-11-10 08:00:00-05', 'in', -12.08335, -77.03335),
(100, '2025-11-10 13:00:00-05', 'lunch_start', -12.08335, -77.03335),
(100, '2025-11-10 14:00:00-05', 'lunch_end', -12.08335, -77.03335),
(100, '2025-11-10 17:00:00-05', 'out', -12.08335, -77.03335);

-- 6. Insertar NOTIFICACIONES (notifications)
INSERT INTO notifications (company_id, employee_id, message, is_read)
VALUES
(1, NULL, 'Aviso general: Mañana habrá mantenimiento de red.', FALSE),
(1, 101, 'Recuerde actualizar su perfil.', FALSE);